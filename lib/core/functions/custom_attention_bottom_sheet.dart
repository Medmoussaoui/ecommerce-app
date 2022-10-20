import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

customAttentionDialogSheet({
  required String title,
  required String subTitle,
  Icon? icon,
}) {
  icon = icon ?? const Icon(Icons.error_outline_rounded);
  Icon customIcons = Icon(
    icon.icon ?? Icons.error_outline_rounded,
    color: icon.color ?? Colors.orange,
    size: icon.size ?? 34,
  );
  Get.bottomSheet(
    Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                color: customIcons.color!.withOpacity(0.1),
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: customIcons,
            ),
          ),
          const SizedBox(height: 30),
          CustomAuthTitle(title: title, fontSize: 17.5),
          const SizedBox(height: 13.5),
          CustomSubTitle(
            subtitle: subTitle,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black87.withOpacity(0.63),
              fontSize: 14.5,
            ),
          ),
        ],
      ),
    ),
  );
}
