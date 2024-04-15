import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_setup/controller/signup_screen_controller.dart';
import 'package:getx_setup/utils/app_routes.dart';
import 'package:getx_setup/utils/app_style.dart';
import '../../common_widgets/custom_scaffold.dart';
import '../../common_widgets/custom_text_field.dart';
import '../../common_widgets/progress_button.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/common_methods.dart';

class SignUpScreen extends GetView<SignUpScreenController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomScaffold(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(
                height: 10,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: SingleChildScrollView(
                  // get started form
                  child: Form(
                    key: controller.loginFormKey.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.signUp,
                          style: AppStyle.blackBold24.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        CustomTextField(
                          headingTitle: null,
                          hintText: AppStrings.firstName,
                          controller: controller.firstNameController.value,
                          onChanged: (value) {
                            controller.getButtonHide();
                          },
                          validator: (value) {
                            return Validators.validateFields(value,
                                "${AppStrings.please} Enter ${AppStrings.firstName}.");
                          },
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        CustomTextField(
                          headingTitle: null,
                          hintText: AppStrings.lastName,
                          controller: controller.lastController.value,
                          onChanged: (value) {
                            controller.getButtonHide();
                          },
                          validator: (value) {
                            return Validators.validateFields(value,
                                "${AppStrings.please} Enter ${AppStrings.lastName}.");
                          },
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        CustomTextField(
                          headingTitle: null,
                          hintText: AppStrings.age,
                          controller: controller.ageController.value,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            controller.getButtonHide();
                          },
                          validator: (value) {
                            return Validators.validateFields(value,
                                "${AppStrings.please} Enter Your ${AppStrings.age}.");
                          },
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomProgressButton(
                                hide: controller.isButtonHide.value,
                                onTap: () async {
                                  await controller.loginApiRequest();
                                },
                                btnText: AppStrings.login,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                             AppStrings.alreadyHaveAnAccount,
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.loginScreen);
                              },
                              child: Text(
                                AppStrings.signIn,
                                style: AppStyle.blackBold16.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
