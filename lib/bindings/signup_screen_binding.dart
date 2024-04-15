import 'package:get/get.dart';
import 'package:getx_setup/controller/signup_screen_controller.dart';

class SignUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpScreenController());
  }
}
