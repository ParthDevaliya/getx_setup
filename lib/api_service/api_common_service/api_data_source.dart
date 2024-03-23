// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as dios;
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/preference_constant.dart';
import '../../utils/preference_utils.dart';
import 'api_request.dart';



class ApiDataSource {
  static final ApiDataSource _singleton = ApiDataSource._internal();

  factory ApiDataSource() {
    return _singleton;
  }

  ApiDataSource._internal();

  Future<APIResult> makeRequest(RemoteRequest request,
      {bool isFormData = false, bool isListRequest = false}) async {
    final Map<String, String> headers;
    Duration timeout = request.timeout ?? const Duration(seconds: 180);

    String? authToken =  await PreferenceUtils().getStringPreference(PreferenceConstant.apiToken);
    
    // ignore: prefer_is_empty
   
      headers = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${authToken.toString()}'
      };
    

    final formDataHeader = {"Content-Type":"multipart/form-data"};

    APIResult result = APIResult();
    log('api call----->${request.url}');
    log('api headers----->$headers');
    if (request.headers.isNotEmpty && request.headers.isNotEmpty) {
      headers.addAll(request.headers);
    }
    final Encoding? encoding = Encoding.getByName('utf-8');
    http.Response? response;

    if (request.type == APIRequestType.get) {
      response = await http
          .get(
            Uri.parse(request.url),
            headers: headers,
          )
          .timeout(timeout);
    } else if (request.type == APIRequestType.post) {
      response = await http
          .post(
            Uri.parse(request.url),
            headers: isFormData ? formDataHeader : headers,
            body: request.requestBody.isNotEmpty
                ? isFormData
                    ? request.requestBody
                    : isListRequest
                        ? json.encode(request.requestList)
                        : json.encode(request.requestBody)
                : null,
            encoding: encoding,
          )
          .timeout(timeout);
    } else if (request.type == APIRequestType.put) {
      response = await http
          .put(
            Uri.parse(request.url),
            headers: headers,
            body: request.requestBody.isNotEmpty
                ? json.encode(request.requestBody)
                : null,
            encoding: encoding,
          )
          .timeout(timeout);
    } else if (request.type == APIRequestType.multipart) {

      try {
        headers.remove(
            'Content-Type'); 
        String? authToken =  await PreferenceUtils().getStringPreference(PreferenceConstant.apiToken);
        var dio = dios.Dio();
        dio.options.headers['Authorization'] = 'Bearer $authToken';
        dios.Response response = await dio.post(
          request.url,
          data: request.requestBody,
          onSendProgress: (received, total) {
          },
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          result.data = response.data;
        } else if (response.statusCode == 401) {
          await unAuthorized();
        } else if (response.statusCode == 400) {
        result.statusCode = response.statusCode;
        result.data = response.data;
        }
        result.statusCode = response.statusCode;
        log("MultiPart Api Response is ${response.data.toString()}");
      } on dios.DioError catch (e) {
        result.statusCode = e.response?.statusCode;
        result.data = e.response?.data;
      }
      return result;
    }
    log("Response is ==> ${response?.body}");
    if (response?.statusCode == 200) {
      await PreferenceUtils().setPreference(PreferenceConstant.isAuth, false);
      if (response!.body.isEmpty) {
        result.data = "done";
      } else {
        result.data = json.decode(utf8.decode(response.bodyBytes));
      }
    } else if (response?.statusCode == 401) {
      await unAuthorized();
    } else {
      result.data = json.decode(utf8.decode(response!.bodyBytes));
    }
    result.statusCode = response?.statusCode;

    return result;
  }
}

unAuthorized() async {
  bool isAuth =
      await PreferenceUtils().getBoolPreference(PreferenceConstant.isAuth);
  if (!isAuth) {
    await PreferenceUtils().setPreference(PreferenceConstant.isAuth, true);
    await PreferenceUtils().setPreference(PreferenceConstant.isDispatchLogIn, false);
    await PreferenceUtils().setPreference(PreferenceConstant.isFloristLogIn, false);
    // Get.offAllNamed(AppRoutes.loginScreen);
  }
}

class APIResult {
  dynamic data;
  late int? statusCode;
}
