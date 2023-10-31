import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tailor_book/Services/MultiLanguageService.dart';
import 'package:tailor_book/UI%20Screens/Constants.dart';
import 'package:tailor_book/UI%20Screens/HomeScreen.dart';
import 'package:tailor_book/UI%20Screens/SplashScreen.dart';

import 'app_routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  print("shared pred val is");
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String check = "${prefs.getBool('login').toString()}";
  bool Seen = false;
  if (check.contains('true')) {
    Seen = true;
  }
  GetStorage.init();
  runApp(MyApp(
    seen: Seen,
  ));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff133946),
    // statusBarBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  final bool seen;

  MyApp({required this.seen});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tailor Book',
          theme: appThemeData,
          translations: LocalizationService(),
          locale: LocalizationService.locale,
          fallbackLocale: LocalizationService.fallbackLocale,
          home: Splash(
            isSeen: seen,
          ),
          getPages: GetPages.namedRoutes,
        navigatorKey: navigatorKey,
      ),
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey =
GlobalKey<NavigatorState>(debugLabel: '_navigation_key');
