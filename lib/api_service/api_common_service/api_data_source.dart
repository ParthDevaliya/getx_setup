import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
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

      headers = {
        'Content-type': 'application/json',
      };
    

    final formDataHeader = {"Content-Type":"multipart/form-data"};

    APIResult result = APIResult();
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
                    :json.encode(request.requestBody)
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
    } 
    log("Response is ==> ${response?.body}");
    if (response?.statusCode == 200) {
      if (response!.body.isEmpty) {
        result.data = "done";
      } else {
        result.data = json.decode(utf8.decode(response.bodyBytes));
      }
    } else {
      result.data = json.decode(utf8.decode(response!.bodyBytes));
    }
    result.statusCode = response.statusCode;
    return result;
  }
}

class APIResult {
  dynamic data;
  late int? statusCode;
}
