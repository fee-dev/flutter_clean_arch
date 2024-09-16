//@formatter:off

import 'package:get_it/get_it.dart';

import 'package:testtest/data/repository/token_repository_impl.dart';
import 'package:testtest/data/source/local/secure_storage/secure_storage_source.dart';
import 'package:testtest/domain/repository/token_repository.dart';

//{imports end}

void registerRepositories(GetIt getIt) {
  getIt.registerSingleton<TokenRepository>(
    TokenRepositoryImpl(getIt<SecureStorageSource>()),
  );
  //{repositories end}
}

TokenRepository get tokenRepository => GetIt.I.get<TokenRepository>();
