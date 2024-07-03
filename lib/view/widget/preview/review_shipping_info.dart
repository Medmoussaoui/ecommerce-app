import 'package:ecommercecourse/controller/checkOut/Preview/index.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewShippingInfo extends GetView<PreviewController> {
  const ReviewShippingInfo({Key? key}) : super(key: key);

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
              const CustomAuthTitle(title: "Shipping", fontSize: 16),
              const Spacer(),
              Transform.translate(
                offset: const Offset(10.0, 0.0),
                child: TextButton(
                  onPressed: () {
                    controller.editShippingInfo();
                  },
                  child: const Text('Edit'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),

          /// Name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CustomSubTitle(subtitle: "Name"),
              Spacer(),
              Text(
                "Mohamed Mousaoui",
                style: TextStyle(color: AppColor.appBarColord),
              ),
            ],
          ),

          /// City
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CustomSubTitle(subtitle: "City"),
                Spacer(),
                Text(
                  "Laayoune",
                  style: TextStyle(color: AppColor.appBarColord),
                ),
              ],
            ),
          ),

          /// Cuntry
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CustomSubTitle(subtitle: "Country"),
              Spacer(),
              Text(
                "Morroco",
                style: TextStyle(color: AppColor.appBarColord),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
