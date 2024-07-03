class CustomformInputValidator {
  static String? Function(String? input) customValidate({
    int? max,
    int? min,
    required String name,
    bool isRequried = true,
  }) {
    return (String? input) {
      if (isRequried && input!.isEmpty) {
        return "$name is required";
      }
      if (max != null && input!.length > max) {
        return '$name most be less then $max character';
      }
      if (min != null && input!.length < min) {
        return '$name most be less then $min character';
      }
      // All Valid
      return null;
    };
  }

  static String? emailValidate(String? input) {
    if (input!.length > 40) {
      return 'email most be less then 40 character';
    }
    if (input.length < 8) {
      return "email most be more then 8 character";
    }
    if (!input.contains('@')) {
      return "please enter valid email address";
    }
    return null;
  }

  static String? passwordValidate(String? input) {
    if (input!.length > 30) {
      return 'password most be less then 30 character';
    }
    if (input.length < 8) {
      return "password most be more then 8 character";
    }
    if (input[0] != input[0].toUpperCase()) {
      return "the first char should be Uppercase letter";
    }
    return null;
  }

  static phoneNumber() {}
}
