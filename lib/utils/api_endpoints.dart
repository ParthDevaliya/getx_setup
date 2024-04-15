class ApiEndPoint {
  ApiEndPoint._();
  static const String baseUrl =
      'https://dummyjson.com/'; 

  
  static const String loginApi = '${baseUrl}auth/login';
  static const String signUpApi = '${baseUrl}users/add';
  static String getProducts(String skip, String limit) => '${baseUrl}products?skip=$skip&limit=$limit';
  static String getSearchProducts(String search,String skip, String limit) => '${baseUrl}products/search?q=$search&skip=$skip&limit=$limit';
}
