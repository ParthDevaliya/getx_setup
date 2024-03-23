import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_setup/utils/common_methods.dart';
import '../api_service/api_common_service/api_data_source.dart';
import '../api_service/api_common_service/api_error_handling.dart';
import '../api_service/api_common_service/api_request.dart';
import '../api_service/requests/login_request.dart';

class LoginScreenController extends GetxController {
  Rx<TextEditingController> userNameController = TextEditingController().obs;
  Rx<TextEditingController> passowrdController = TextEditingController().obs;
  late APIResult result;
  RxBool isPassword = true.obs;

  
  @override
  void onInit() async {
    super.onInit();
  }

  dispatchLoginAPI() async {
    Map<String, dynamic> requestBody = {
      "username": userNameController.value.text.toString(),
      "password": passowrdController.value.text.toString(),
    };
    log("Login Request ==> $requestBody");
    await apiCallFun(LoginRequest(request: requestBody), ApiDataSource(),
        apiName: "login");
  }

  Future<void> apiCallFun(
      RemoteRequest remoteRequest, ApiDataSource apiDataSource,
      {String? apiName}) async {
    try {
      result = await apiDataSource.makeRequest(remoteRequest);

      if (result.statusCode == 200) {
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
}
