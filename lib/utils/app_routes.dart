import 'package:get/get.dart';
import 'package:getx_setup/bindings/home_screen_binding.dart';
import 'package:getx_setup/bindings/login_screen_binding.dart';
import 'package:getx_setup/bindings/search_screen_binding.dart';
import 'package:getx_setup/bindings/signup_screen_binding.dart';
import 'package:getx_setup/bindings/splash_screen_binding.dart';
import 'package:getx_setup/view/home/home_screen.dart';
import 'package:getx_setup/view/home/search/search_screen.dart';
import 'package:getx_setup/view/sign_up/sign_up.dart';
import 'package:getx_setup/view/splash/splash_screen.dart';
import '../view/login/login_screen.dart';
class AppRoutes {
  AppRoutes._();

  static const loginScreen = "/loginScreen";
  static const splashScreen = "/splashScreen";
  static const signUpScreen = "/signUpScreen";
  static const homeScreen = "/homeScreen";
  static const searchScreen = "/searchScreen";

  static final routes = [
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      binding: LoginScreenBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
     GetPage(
      name: signUpScreen,
      page: () => const SignUpScreen(),
      binding: SignUpScreenBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
     GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
     GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
     GetPage(
      name: searchScreen,
      page: () => const SearchScreen(),
      binding: SearchScreenBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
