import 'package:flutter/cupertino.dart';

class PaypalController {
  final TextEditingController paypalEmail = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  String? formValidation(String? input) {
    if (paypalEmail.text.length < 7) {
      return "most be more then 7 character";
    }
    if (!paypalEmail.text.contains("@")) {
      return "this is not an email address";
    }
    return null;
  }

  bool validate() {
    bool valid = formState.currentState!.validate();
    if (!valid) formState.currentState!.save();
    return valid;
  }

  dispose() {
    paypalEmail.dispose();
  }
}
