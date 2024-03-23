class ApiEndPoint {
  ApiEndPoint._();
  static const String baseUrl =
      'https://hanaposservices.com/DriverApi/api/'; 
  
  // Driver Base URL
  static const String driverBaseUrl = '${baseUrl}Driver/';

  // Florist Base URL
  // static const String floristBaseUrl = '${baseUrl}Florist/';

  
  //Drivers Endpoints Apis
  static const driverLogin = '${driverBaseUrl}Login';
  static const tripList = '${driverBaseUrl}TripDetails';
  static String routesList({required String routeId}) => '${driverBaseUrl}RouteDetails2?Route=$routeId';
  static const getDeliveryCodes = '${driverBaseUrl}GetDeliveryCodes';
  static String searchRoutesList({required String searchText}) => '${driverBaseUrl}RouteDetailsByDriver?SearchText=$searchText';
  static const confirmOrder = '${driverBaseUrl}UpdateOrder';
  static const confirmOrderMultipart = '${driverBaseUrl}UpdateOrderNew';
  static const insertDriverLocations = '${driverBaseUrl}InsertDriverLocations';



  //Florist Endpoints Apis
  static String checkInvoiceNoApi({required String invoiceNo}) => '${driverBaseUrl}CheckInvoiceAccessForLoginUser?Invoice=$invoiceNo';
  static String getDesignerList({required String shopId}) => '${driverBaseUrl}GetAllDesignerEmployee?ShopId=$shopId';
}
