import '../../utils/api_endpoints.dart';
import '../api_common_service/api_request.dart';

class GetProductsRequest extends RemoteRequest {
  GetProductsRequest({required String skip, required String limit}) {
    initialize(skip, limit);
  }

  void initialize(String skip, String limit) {
    url = ApiEndPoint.getProducts(skip, limit);
    type = APIRequestType.get;
  }
}


class GetSearchProductsRequest extends RemoteRequest {
  GetSearchProductsRequest({required String search, required String skip, required String limit}) {
    initialize(search,skip, limit);
  }

  void initialize(String search, String skip, String limit) {
    url = ApiEndPoint.getSearchProducts(search, skip, limit);
    type = APIRequestType.get;
  }
}
