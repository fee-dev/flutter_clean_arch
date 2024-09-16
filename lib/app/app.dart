//@formatter:off

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:testtest/app/bloc/app_bloc_imports.dart';
import 'package:testtest/app/localization/generated/l10n.dart';
import 'package:testtest/app/router/app_router.dart';
import 'package:testtest/core/arch/bloc/base_bloc_state.dart';
import 'package:testtest/presentation/style/theme/theme_imports.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends BaseState<AppScreenState, AppBloc, AppSR, App> {
  Locale? locale;

  @override
  Widget buildWidget(BuildContext context) {
    AppRouter.init();
    return GlobalLoaderOverlay(
      overlayColor: Colors.black.withOpacity(0.5),
      child: blocBuilder(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.noScaling),
                child: widget ?? const SizedBox(),
              );
            },
            scrollBehavior: const CupertinoScrollBehavior(),
            theme: createLightTheme(),
            darkTheme: createDarkTheme(),
            themeMode: state.themeMode,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routerDelegate: AppRouter.router.routerDelegate,
            locale: locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            onGenerateTitle: (context) => S.of(context).title,
          );
        },
      ),
    );
  }
}
