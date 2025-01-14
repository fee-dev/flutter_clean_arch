import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pp;

import 'package:testtest/app/service/hive_cipher_key_service.dart';
import 'package:testtest/core/arch/logger/app_logger_impl.dart';
import 'package:testtest/core/di/local.dart';
import 'package:testtest/data/source/local/secure_storage/secure_storage_keys.dart';

class CacheInterceptor {
  final Dio client;

  CacheOptions? cacheOptions;
  HiveCacheStore? _cacheStore;
  DioCacheInterceptor? _interceptor;

  CacheInterceptor(this.client);

  Future<void> attachCacheInterceptor() async {
    try {
      final options = await createOptions();
      final interceptor = DioCacheInterceptor(options: options);
      _interceptor = interceptor;

      client.interceptors.add(interceptor);
      cacheOptions = options;

      client.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          //ignore: cascade_invocations
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        },
      );

      logger.d('DioCacheInterceptor ADDED');
    } catch (e, trace) {
      logger.crash(
        reason: 'DioCacheInterceptor Error',
        error: e,
        stackTrace: trace,
      );
    }
  }

  Future<CacheOptions> createOptions() async {
    final dir = await pp.getApplicationDocumentsDirectory();
    final keyService = HiveCipherKeyService(secureStorageSource());
    final key = await keyService.init();

    _cacheStore =
        HiveCacheStore(dir.path, encryptionCipher: HiveAesCipher(key));

    return CacheOptions(
      store: _cacheStore,
      policy: CachePolicy.noCache,
      hitCacheOnErrorExcept: [],
      maxStale: const Duration(days: 1),
      allowPostMethod: true,
    );
  }

  CachePolicy getCachePolicy({required bool forceRefresh}) {
    return forceRefresh
        ? CachePolicy.refreshForceCache
        : CachePolicy.forceCache;
  }

  Future<void> clearCache() async {
    await secureStorageSource().delete(SecureStorageKeys.kSecretKeyCipher);
    await _cacheStore?.clean();
  }

  void deAttachInterceptor() {
    client.interceptors.remove(_interceptor);
  }
}
