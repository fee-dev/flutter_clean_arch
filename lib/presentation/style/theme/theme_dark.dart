import 'package:flutter/material.dart';

import 'package:testtest/presentation/style/theme/theme_imports.dart';

ThemeData createDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
    extensions: [
      ThemeColors.dark(),
      ThemeTextStyles.dark(),
    ],
    dialogTheme:
        const DialogTheme(backgroundColor: AppColors.scaffoldBackgroundDark),
  );
}
