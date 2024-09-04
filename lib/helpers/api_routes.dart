
class ApiRoutes{

  ApiRoutes._();

  //static const String baseUrl = "http://192.168.31.37:8000/api/";
  static const String baseUrl = "https://dev.geniieshop.com/api/";
  static const String getAllProduct = "${baseUrl}products";
  static const String getProductByCategoryId = "${baseUrl}products/";
  static const String login = "${baseUrl}login";
  static const String logout = "${baseUrl}logout";
  static const String register = "${baseUrl}register";
  static const String addRequest = "${baseUrl}requests";
  static const String getRequests = "${baseUrl}requests";



}