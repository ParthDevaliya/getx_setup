import 'package:get/get.dart';
import 'package:getx_setup/view/login/login_screen.dart';
import '../bindings/splash_screen_binding.dart';
import '../view/splash_screen/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const splashScreen = "/splashScreen";
  static const loginScreen = "/loginScreen";

  static final routes = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      binding: SplashScreenBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
