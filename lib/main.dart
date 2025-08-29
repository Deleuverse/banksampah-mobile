import 'dart:developer';
import 'dart:io';

import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/configs/resources/theme.dart';
import 'app/network/token_provider.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/global_bindings.dart';
import 'app/utils/preferences_helper.dart';

late SharedPreferences prefs;
final navigatorKey = GlobalKey<NavigatorState>();

// Create Alice with the navigator key

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  debugPaintSizeEnabled = false;


  tz.initializeTimeZones();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  prefs = await SharedPreferences.getInstance();
  bool isLogin = PreferencesHelper.getIsFirstLogin();
  await Future.delayed(const Duration(seconds: 1));

  FlutterNativeSplash.remove();
  PreferencesHelper().saveIsconnect(false);
  PreferencesHelper().saveInteractionType("null");
  PreferencesHelper().saveEventCode("null");
  String token = "";
  if (isLogin) {
    token = await TokenProvider().getAccessToken();
    log(token);
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    String initialRoute = await determineInitialRoute(token);

    runApp(
      ScreenUtilInit(
        ensureScreenSize: true,
        enableScaleWH: () => true,
        enableScaleText: () => true,
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          ScreenUtil.init(context,
              designSize: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height));

          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.noScaling),
            child: GetMaterialApp(
                navigatorKey: navigatorKey,
                builder: (context, child) => ResponsiveBreakpoints.builder(
                  child: child!,
                  breakpoints: [
                    const Breakpoint(start: 0, end: 450, name: MOBILE),
                    const Breakpoint(start: 451, end: 800, name: TABLET),
                  ],
                ),
                debugShowCheckedModeBanner: false,
                title: 'Ralla',
                theme: ThemeConfig.lightTheme,
                initialRoute: initialRoute,
                initialBinding: GlobalBindings(),
                getPages: AppPages.routes,

            ),
          );
        },
      ),
    );
  });
}

Future<String> determineInitialRoute(String token) async {
  // final SharedPreferences prefs = await SharedPreferences.getInstance();

  // bool hasSeenOnboarding = prefs.getBool(HAS_SEEN_ONBOARDING) ?? false;

  // if (hasSeenOnboarding) {
  //   return Routes.SIGNUP;
  // }
   bool isLogin = PreferencesHelper.getIsFirstLogin();
    var homeType = PreferencesHelper().getRoleTypeAdd();
    var selectedProfile = PreferencesHelper().getSelectedProfile();
    if (isLogin==false) {
      return Routes.LOGIN;
    } else {
      return Routes.HOME;
    }

}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
