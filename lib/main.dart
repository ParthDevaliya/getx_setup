import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/splash_screen_binding.dart';
import 'utils/app_routes.dart';
import 'utils/app_style.dart';
import 'view/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hana Viewer',
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