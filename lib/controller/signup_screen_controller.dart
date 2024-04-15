import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api_service/api_common_service/api_data_source.dart';
import '../api_service/api_common_service/api_error_handling.dart';
import '../api_service/api_common_service/api_request.dart';
import '../api_service/requests/login_request.dart';
import '../api_service/requests/signup_request.dart';
import '../utils/app_routes.dart';
import '../utils/common_methods.dart';
import '../utils/preference_constant.dart';
import '../utils/preference_utils.dart';

class SignUpScreenController extends GetxController {
  Rx<GlobalKey<FormState>> loginFormKey = GlobalKey<FormState>().obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastController = TextEditingController().obs;
  Rx<TextEditingController> ageController = TextEditingController().obs;
  late APIResult result;
  RxBool isPassword = true.obs;
  RxBool isButtonHide = true.obs;


  loginApiRequest() async {
    Map<String, dynamic> requestBody = {
      "firstName": firstNameController.value.text.toString(),
      "lastName": lastController.value.text.toString(),
      "age": ageController.value.text.toString(),
    };
    await apiCallFun(SignUpRequest(request: requestBody), ApiDataSource());
  }

  Future<void> apiCallFun(
      RemoteRequest remoteRequest, ApiDataSource apiDataSource,
      {String? apiName}) async {
    try {
      result = await apiDataSource.makeRequest(remoteRequest);

      if (result.statusCode == 200) {
         await PreferenceUtils().setPreference(PreferenceConstant.isLogin, true);
         Get.offAllNamed(AppRoutes.homeScreen);
        //  await PreferenceUtils().setPreference(PreferenceConstant.userId, result.data['id'].toString());
        //  await PreferenceUtils().setPreference(PreferenceConstant.userName, result.data['username'].toString());
        log("Sign Up Api Response is ==> ${result.data}");
      } else {
        CommonMethods.errorSnackBar(await response(result));
      }
    } on SocketException {
      CommonMethods.errorSnackBar(InternetConnectionException());
    } on TimeoutException {
      CommonMethods.errorSnackBar(InternetConnectionException());
    } catch (e) {
      CommonMethods.errorSnackBar(e.toString());
    }
  }

    getButtonHide() {
    if (firstNameController.value.text.isNotEmpty &&
        lastController.value.text.isNotEmpty 
        && ageController.value.text.isNotEmpty) {
      isButtonHide(false);
    } else {
      isButtonHide(true);
    }
  }
}
