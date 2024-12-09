import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice_app/features/home/screens/home_page.dart';

import 'features/onboarding/screens/onboarding_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
     scaffoldBackgroundColor: Colors.white,
     colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)
    ),
    themeMode: ThemeMode.system,
    home: HomePage(),
  ));
}
