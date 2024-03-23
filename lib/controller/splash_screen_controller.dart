import 'package:get/get.dart';
import '../utils/app_routes.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateScreen();
  }

  navigateScreen() async {
    Future.delayed(const Duration(seconds: 7), () async {
      // if (await PreferenceUtils()
      //     .getBoolPreference(PreferenceConstant.isDispatchLogIn)) {
      //   Get.offAndToNamed(AppRoutes.tripScreen);
      // } else if (await PreferenceUtils()
      //     .getBoolPreference(PreferenceConstant.isFloristLogIn)) {
      //   Get.offAndToNamed(AppRoutes.floristHomeScreen);
      // }else {
      Get.offAndToNamed(AppRoutes.loginScreen);
      // }
    });
  }
}
