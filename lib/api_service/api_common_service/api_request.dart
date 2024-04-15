enum APIRequestType { get, post, multipart, put }

class RemoteRequest {
  late String url;
  late dynamic requestBody;
  late APIRequestType type;
  late Map<String, String> headers = {'Content-Type': 'application/json'};
  Duration? timeout;
}
