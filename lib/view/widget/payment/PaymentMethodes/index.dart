import 'package:ecommercecourse/controller/checkOut/payment/index.dart';
import 'package:ecommercecourse/view/widget/payment/PaymentMethodes/cash_on_delivery.dart';
import 'package:ecommercecourse/view/widget/payment/PaymentMethodes/pay_via_credit_cart.dart';
import 'package:ecommercecourse/view/widget/payment/PaymentMethodes/pay_via_paypal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPaymentMethode extends StatelessWidget {
  const SelectPaymentMethode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentScreenContoller>(
      builder: (con) {
        return Container(
          padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10, right: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey[400]!),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PaymentCashOnDelivery(value: 1, groupValue: con.paymentMethode.value),
              Divider(color: Colors.grey[400]),
              PaymentViaPaypal(value: 2, groupValue: con.paymentMethode.value),
              Divider(color: Colors.grey[400]),
              PaymentViaCreditCart(value: 3, groupValue: con.paymentMethode.value),
            ],
          ),
        );
      },
    );
  }
}
