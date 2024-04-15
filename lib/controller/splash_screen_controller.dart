
import 'package:get/get.dart';
import '../utils/app_routes.dart';
import '../utils/preference_constant.dart';
import '../utils/preference_utils.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateScreen();
  }

  navigateScreen() async {
    Future.delayed(const Duration(seconds: 4), () async {
      if (await PreferenceUtils()
          .getBoolPreference(PreferenceConstant.isLogin)) {
        Get.offAndToNamed(AppRoutes.homeScreen);
      }else {
      Get.offAndToNamed(AppRoutes.loginScreen);
      }
    });
  }
}
