import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widgets/custom_text_field.dart';
import '../../common_widgets/progress_button.dart';
import '../../controller/login_screen_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/common_methods.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextField(
                      headingTitle: null,
                      hintText: AppStrings.userName,
                      controller: controller.userNameController.value,
                      prefixIcon: Icon(
                        Icons.person_3,
                        color: AppColors.blackColor.withOpacity(0.4),
                      ),
                      onChanged: (value) {},
                      validator: (value) {
                        return Validators.validateFields(value,
                            "${AppStrings.please} Enter ${AppStrings.userName}.");
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      headingTitle: null,
                      hintText: AppStrings.password,
                      controller: controller.passowrdController.value,
                      isObscureText: true,
                      obscureText: controller.isPassword.value,
                      prefixIcon: Icon(
                        Icons.lock_sharp,
                        color: AppColors.blackColor.withOpacity(0.4),
                      ),
                      onChanged: (value) {},
                      obscureTextTap: () {
                        controller.isPassword.value =
                            !controller.isPassword.value;
                      },
                      validator: (value) {
                        return Validators.validateFields(value,
                            "${AppStrings.please} Enter ${AppStrings.password}.");
                      },
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomProgressButton(
                        hide: false,
                        onTap: () async {
                          // await controller.dispatchLoginAPI();
                        },
                        btnText: "${AppStrings.login}",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
