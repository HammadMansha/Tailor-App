import 'package:get/get.dart';
import 'package:tailor_book/Controllers/HomeController.dart';
import 'package:tailor_book/Controllers/LoginScreenController.dart';

import '../UI Screens/HomeScreen.dart';
import '../UI Screens/LoginScreen.dart';

class GetPages {
  static List<GetPage> namedRoutes = [
    GetPage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController())),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => HomeController())),
    ),
  ];
}
