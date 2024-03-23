import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_setup/utils/app_strings.dart';
import 'package:getx_setup/utils/app_style.dart';

import '../../controller/splash_screen_controller.dart';
import '../../utils/app_colors.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: null,
      body: Center(
          child: Text(
        AppStrings.splashScreen,
        style: AppStyle.blackBold24,
      )),
    );
  }
}
