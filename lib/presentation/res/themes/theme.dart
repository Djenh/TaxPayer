import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/res/style/e_style.dart';

class KThemes {
  // **Thème clair - Material 3**
  static ThemeData lightTheme(BuildContext _) {
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
      ).copyWith(surface: KStyles.backgroundColor).copyWith(error: KStyles.errorColor),
    );
  }

  // **Thème sombre - Material 3**
  static ThemeData darkTheme(BuildContext _) {
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
    ).copyWith(surface: KStyles.backgroundColor).copyWith(error: KStyles.errorColor),
    );
  }
}