import 'package:ecommercecourse/controller/checkOut/payment/index.dart';
import 'package:flutter/cupertino.dart';

class CreditCardFormController {
  final PaymentScreenContoller _paymentScreenContoller;
  CreditCardFormController(this._paymentScreenContoller);

  late TextEditingController cartNumber = TextEditingController();
  late TextEditingController expire = TextEditingController();
  late TextEditingController cvv = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool cartNumberValid = true;
  bool expireValid = true;
  bool cvvValid = true;

  bool get isAllValid => cartNumberValid && expireValid && cvvValid;

  setAllValid() {
    cartNumberValid = true;
    expireValid = true;
    cvvValid = true;
  }

  bool validateInput() {
    setAllValid();
    if (cartNumber.text.length < 13) {
      cartNumberValid = false;
    }
    if (expire.text.length < 4) {
      expireValid = false;
    }
    if (cvv.text.length < 3) {
      cvvValid = false;
    }
    _paymentScreenContoller.update(["credit card"]);
    return isAllValid;
  }

  dispose() {
    cartNumber.dispose();
    expire.dispose();
    cvv.dispose();
  }
}
