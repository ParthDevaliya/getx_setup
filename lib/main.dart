import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_setup/bindings/splash_screen_binding.dart';
import 'package:getx_setup/view/splash/splash_screen.dart';
import 'utils/app_routes.dart';
import 'utils/app_style.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global =  MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppStyle.lightTheme,
      darkTheme: AppStyle.darkTheme,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
      initialBinding: SplashScreenBinding(),
      getPages: AppRoutes.routes,
    );
  }
}
