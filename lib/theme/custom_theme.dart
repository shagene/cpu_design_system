import 'package:cpu_design_system/theme/pallette.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData darkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          Palette.disco500.value,
          const {
            100: Palette.disco100,
            200: Palette.disco200,
            300: Palette.disco300,
            400: Palette.disco400,
            500: Palette.disco500,
            600: Palette.disco600,
            700: Palette.disco700,
            800: Palette.disco800,
            900: Palette.disco900,
          },
        ),
        accentColor: Palette.disco500,
        brightness: Brightness.light,
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: Palette.almostBlack,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Palette.almostBlack,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade800,
        thumbColor: Colors.white,
        valueIndicatorColor: Palette.disco500,
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
      ),
      textTheme: theme.primaryTextTheme
          .copyWith(
            button: theme.primaryTextTheme.button?.copyWith(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
          .apply(
            displayColor: Colors.black,
          ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Palette.disco500,
        ),
      ),
    );
  }
}
