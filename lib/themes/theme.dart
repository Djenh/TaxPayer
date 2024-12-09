import 'package:flutter/material.dart';
import 'package:invoice_app/style/e_style.dart';

class KThemes {
  // **Thème clair - Material 3**
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: KStyles.backgroundColor,
      primaryColor: KStyles.primaryColor,
    //  surfaceColor: KStyles.surfaceColor,
      textTheme: KStyles.buildTextTheme(Typography.material2018().black),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: KStyles.primaryButtonStyle,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: KStyles.secondaryButtonStyle,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: KStyles.surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(KStyles.borderRadiusSmall),
          borderSide: const BorderSide(color: KStyles.textLightColor),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: KStyles.primaryColor,
        titleTextStyle: KStyles.headline2.copyWith(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: KStyles.primaryColor),
      cardTheme: CardTheme(
        color: KStyles.surfaceColor,
        elevation: KStyles.elevationMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(KStyles.borderRadiusMedium),
        ),
      ), colorScheme: ColorScheme.fromSeed(
        seedColor: KStyles.primaryColor,
        brightness: Brightness.light,
      ).copyWith(background: KStyles.backgroundColor).copyWith(error: KStyles.errorColor),
    );
  }

  // **Thème sombre - Material 3**
  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF121212),
  //    surfaceColor: const Color(0xFF1E1E1E),
      primaryColor: KStyles.primaryColor,
      textTheme: KStyles.buildTextTheme(Typography.material2018().white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: KStyles.primaryButtonStyle,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: KStyles.secondaryButtonStyle,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(KStyles.borderRadiusSmall),
          borderSide: const BorderSide(color: KStyles.textLightColor),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: KStyles.primaryColor,
        titleTextStyle: KStyles.headline2.copyWith(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: KStyles.primaryColor),
      cardTheme: CardTheme(
        color: const Color(0xFF1E1E1E),
        elevation: KStyles.elevationMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(KStyles.borderRadiusMedium),
        ),
      ), colorScheme: ColorScheme.fromSeed(
        seedColor: KStyles.primaryColor,
        brightness: Brightness.dark,
      ).copyWith(secondary: KStyles.accentColor).copyWith(background: const Color(0xFF121212)).copyWith(error: KStyles.errorColor),
    );
  }
}