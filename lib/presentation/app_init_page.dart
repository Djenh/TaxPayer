import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invoice_app/core/services/app_service.dart';
import 'package:invoice_app/presentation/features/home/screens/home_page.dart';
import 'package:invoice_app/presentation/res/themes/overlay/app_overlay.dart';
import 'package:invoice_app/presentation/res/themes/theme.dart';

import '../../core/constants/app_constants.dart';
import 'controllers/theme_ctrl.dart';
import 'features/agency/screens/agency_page.dart';
import 'features/onboarding/screens/onboarding_page.dart';


class AppInitPage extends StatefulWidget {
  const AppInitPage({super.key});

  @override
  State<AppInitPage> createState() => _AppInitPageState();
}

class _AppInitPageState extends State<AppInitPage> with WidgetsBindingObserver {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, Widget? child) => GetBuilder<ThemeCtrl>(
        init: ThemeCtrl(),
        autoRemove: false,
        builder: (_) => AnnotatedRegion(
          value: _.overStyle.value,
          child: KeyboardVisibilityProvider(
            child: GetMaterialApp(
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              scrollBehavior: AppScrollBehavior(),
              //themeMode: ThemeMode.light,
              themeMode: ThemeMode.system,
              theme: KThemes.lightTheme(context),
              darkTheme: KThemes.darkTheme(context),
              home: AppServices.instance.currentCompany.value != null
                  ? HomePage()
                  : AgencyPage(isManage: true),//const OnboardingPage(),
              localizationsDelegates: const <LocalizationsDelegate>[
                ...GlobalMaterialLocalizations.delegates,
              ],
              locale: const Locale('fr', 'FR'),
              builder: (BuildContext context, _) {
                return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                        textScaler: MediaQuery.of(context)
                            .textScaler
                            .clamp(minScaleFactor: .9, maxScaleFactor: 1)),
                    child: _!);
              },
              defaultTransition: Transition.fadeIn,
              routingCallback: (Routing? routing) {
                WidgetsBinding.instance.addPostFrameCallback((__) {
                  if (routing != null) {
                    if (routing.current == '/' ||
                        routing.current == '/OnboardingPage') {
                      _.updateOverStyle(AppUiOverlay.started);
                    }else {
                      _.updateOverStyle(AppUiOverlay.light);
                    }
                  }
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}


class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
