import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'package:get/get.dart';
import 'app_strings.dart';

class CommonMethods {
  CommonMethods._();

  static errorSnackBar(message, {String? title}) {
    return Get.snackbar(
      title ?? "Error",
      "$message",
      snackPosition: SnackPosition.TOP,
      colorText: AppColors.whiteColor,
      borderRadius: 10,
      backgroundColor: AppColors.redColor,
    );
  }
}


class Validators {
  static String? validateFields(String? str, String? customAlert,
      [FocusNode? focusNodeForRegDate]) {
    String value = (str ?? "").trim();
    if (value.isEmpty) {
      return customAlert ?? AppStrings.pleaseFillUpThisField;
    } else {
      return null;
    }
  }
}
