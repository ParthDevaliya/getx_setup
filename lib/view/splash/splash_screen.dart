import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/splash_screen_controller.dart';
import '../../utils/app_colors.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: null,
      body: Center(
      ),
    );
  }
}
