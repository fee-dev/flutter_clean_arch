//@formatter:off

import 'package:go_router/go_router.dart';

import 'package:testtest/app/router/app_route.dart';
import 'package:testtest/core/di/services.dart';

//{imports end}

class AppRouter {
  static const _initialLocation = '/';

  static final AppRouter _instance = AppRouter._privateConstructor();
  static late GoRouter router;

  AppRouter._privateConstructor() {
    _initialize();
  }

  factory AppRouter.init() {
    return _instance;
  }

  void _initialize({String initialLocation = _initialLocation}) {
    router = GoRouter(
      initialLocation: initialLocation,
      refreshListenable: sessionService(),
      redirect: (context, state) {
        return null;
      },
      routes: <GoRoute>[
        //{routes end}
      ],
    );
  }
}
