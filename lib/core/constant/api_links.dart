class AppLinksApi {
  // API URL
  static const String serverUrl = "http://192.168.1.106:8000";

  // IMAGE PATH URL
  static const String imagePath = "$serverUrl/uploads";

  static const String signIn = "$serverUrl/auth/signin";

  // ========> SIGN UP

  static const String signUp = "$serverUrl/auth/signup";
  static const String verifyCode = "$serverUrl/auth/signup/verifycode";
  static const String sendVerifyCode = "$serverUrl/auth/signup/sendverifycode";

  // ========> FORGET PASSWORD

  static const String forgetPasswordSendVerifyCode = "$serverUrl/auth/forgetpassword/sendverifycode";
  static const String forgetPasswordVerifyCode = "$serverUrl/auth/forgetpassword/verifycode";
  static const String resetPassword = "$serverUrl/auth/forgetpassword/resetpassword";

  // ========> HOME

  static const String initialHome = "$serverUrl/home";
  static const String search = "$serverUrl/home/search";
  static const String products = "$serverUrl/home/products";

  // ========> Favorite

  static const String favorite = "$serverUrl/favorite";
  static const String favoriteRemove = "$serverUrl/favorite/remove";
  static const String addToFavorite = "$serverUrl/favorite/add";

  // ========> Favorite
  static const String addToCart = "$serverUrl/home/productDetails/addToCart";

  // ========> Shopping Cart
  static const String shoppingCartItems = "$serverUrl/shoppingCart";
  static const String shoppingCartRemoveItems = "$serverUrl/shoppingCart/remove";
  static const String shoppingCartUpdateItem = "$serverUrl/shoppingCart/update";
}
