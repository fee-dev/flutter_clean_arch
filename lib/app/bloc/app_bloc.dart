import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:testtest/app/bloc/app_bloc_imports.dart';
import 'package:testtest/core/arch/bloc/base_bloc.dart';

class AppBloc extends BaseBloc<AppEvent, AppScreenState, AppSR> {
  AppBloc() : super(const AppScreenState(themeMode: ThemeMode.system)) {
    on<ChangeThemeEvent>(_onChangeTheme);
  }

  void _onChangeTheme(
    ChangeThemeEvent event,
    Emitter<AppScreenState> emit,
  ) {
    emit(state.copyWith(themeMode: event.mode));
  }
}
