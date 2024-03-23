import 'dart:io';

enum APIRequestType { get, post, multipart, put }

class RemoteRequest {
  late String url;
  // late Map<String, dynamic> requestBody;
  late dynamic requestBody;
  late List requestList;
  late APIRequestType type;
  late Map<String, String> headers = {'Content-Type': 'application/json'};
  List<File?> file = [];
  Duration? timeout;
  String? multipartKeyName = "files";
}
