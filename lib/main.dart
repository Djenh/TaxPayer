import 'package:flutter/material.dart';
import 'package:invoice_app/presentation/app_init_page.dart';
import 'package:invoice_app/presentation/features/agency/screens/agency_page.dart';
import 'core/configs/environment_config.dart';
import 'core/enums/env_enum.dart';
import 'core/services/init_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initAppServices();

  EnvironmentConfig.setEnvironment(Environment.dev);
  runApp(const AppInitPage());
}


/*void main() {
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
    home: const OnboardingPage(),
  ));
}*/
