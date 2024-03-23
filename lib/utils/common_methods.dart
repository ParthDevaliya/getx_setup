// ignore_for_file: unnecessary_new, deprecated_member_use, prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getx_setup/utils/app_strings.dart';
import '../utils/app_colors.dart';
import 'package:get/get.dart';

import 'app_style.dart';

class CommonMethods {
  CommonMethods._();

  static showToast({required String title, required dynamic message}) {
    return Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: '$message',
        duration: const Duration(seconds: 2),
      ),
    );
  }

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

    static warningSnackBar(message, {String? title}) {
    return Get.snackbar(
      title ?? "Oops",
      "$message",
      snackPosition: SnackPosition.TOP,
      colorText: AppColors.whiteColor,
      borderRadius: 10,
      backgroundColor: Colors.orange,
    );
  }

  static sucessSnackBar({required String message}) {
    return Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.TOP,
      colorText: AppColors.whiteColor,
      borderRadius: 10,
      backgroundColor: AppColors.greenColor,
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
