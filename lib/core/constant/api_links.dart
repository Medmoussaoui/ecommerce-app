class AppLinksApi {
  static const String serverUrl = "http://192.168.1.100:8000";

  static const String signIn = "$serverUrl/auth/signin";

  // ========> SIGN UP

  static const String signUp = "$serverUrl/auth/signup";
  static const String verifyCode = "$serverUrl/auth/signup/verifycode";
  static const String sendVerifyCode = "$serverUrl/auth/signup/sendverifycode";

  // ========> FORGET PASSWORD

  static const String forgetPasswordSendVerifyCode =
      "$serverUrl/auth/forgetpassword/sendverifycode";
  static const String forgetPasswordVerifyCode =
      "$serverUrl/auth/forgetpassword/verifycode";
  static const String resetPassword =
      "$serverUrl/auth/forgetpassword/resetpassword";
}
