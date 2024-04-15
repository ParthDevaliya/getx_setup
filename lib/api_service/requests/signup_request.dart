import '../../utils/api_endpoints.dart';
import '../api_common_service/api_request.dart';

class SignUpRequest extends RemoteRequest {
  SignUpRequest({required Map<String, dynamic> request}) {
    initialize(request);
  }

  void initialize(Map<String, dynamic> request) {
    url = ApiEndPoint.signUpApi;
    requestBody = request;
    type = APIRequestType.post;
  }
}
