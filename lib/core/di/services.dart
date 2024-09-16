//@formatter:off

import 'package:get_it/get_it.dart';

import 'package:testtest/app/service/app_service.dart';
import 'package:testtest/app/service/session_service/session_service.dart';

void registerCoreServices(GetIt getIt) {
  getIt
    ..registerSingleton<SessionService>(SessionService())
    ..registerSingleton<AppService>(AppService());
}

void registerAppServices(GetIt getIt) {}

SessionService sessionService() => GetIt.I.get<SessionService>();

AppService environmentService() => GetIt.I.get<AppService>();
