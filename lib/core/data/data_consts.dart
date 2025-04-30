class DataConsts {
  // static const String serverUrl = "https://menaexpr.technoplus.dev";
  static const String serverUrl = "http://194.5.157.103:3000";
  static const String imagesUrl = "$serverUrl/storage";
  static const String baseUrl = "$serverUrl/api/";


  static const String register = 'auth/customer/register';
  static const String login = 'auth/customer/login';
  static const String logout = 'auth/customer/logout';
  static const String verifyOTP = 'auth/customer/verify-phone';
  static const String resendOTP = 'otp/resend';
  static const String forgetPassword = 'auth/customer/request-password-reset';
  static const String resetPassword = 'auth/customer/reset-password';
  static const String passwordOtp = 'auth/customer/verify-password-reset-code';
  static const String getCities = 'platform/cities';
  static const String getCountries = 'platform/countries';
  static const String getProfile = 'auth/customer/profile';

  static const String scrapeProduct = 'commerce/';
  static const String getProductDetails = 'commerce/products/';
  static const String getCarousels = 'content/carousels';

  //Bag
  static const String bag = 'commerce/cart';
  static const String order = 'commerce/orders';
  static const String payment = 'platform/payment-methods';
  static const String returned = 'commerce/returned-inventory';
  ///api/commerce/products/{product}
}
