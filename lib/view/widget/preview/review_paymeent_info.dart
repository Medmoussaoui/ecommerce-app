import 'package:ecommercecourse/controller/checkOut/Preview/index.dart';
import 'package:ecommercecourse/controller/checkOut/payment/index.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/preview/cash_on_delivery_info.dart';
import 'package:ecommercecourse/view/widget/preview/credit_card_info.dart';
import 'package:ecommercecourse/view/widget/preview/paypal_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewPaymentInfo extends GetWidget<PreviewController> {
  const ReviewPaymentInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 20, right: 15, left: 15),
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              const CustomAuthTitle(title: "Payment", fontSize: 16),
              const Spacer(),
              Transform.translate(
                offset: const Offset(10.0, 0.0),
                child: TextButton(
                  onPressed: () {
                    controller.editPaymentInfo();
                  },
                  child: const Text('Edit'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Builder(builder: (context) {
            final paymentMethode = Get.find<PaymentScreenContoller>().paymentMethode.value;
            if (paymentMethode == 1) return const CashOnDeliveryInfoPreview();
            if (paymentMethode == 2) return const PaypalInfoPreview();
            return const CreditCardInfoPreview();
          })
        ],
      ),
    );
  }
}
