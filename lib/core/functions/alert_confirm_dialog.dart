import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

customalertDialogSimpleConfirm({
  required String title,
  required String subTitle,
  Icon? icon,
  String confirmText = "Accept",
  String cancelText = "Cancel",
  void Function()? onConfirm,
  void Function()? onCancel,
}) async {
  bool state = false;
  late Widget iconWidget;
  if (icon != null) {
    iconWidget = Icon(
      icon.icon,
      color: icon.color ?? AppColor.blackGrey,
      size: icon.size ?? 34,
    );
  } else {
    iconWidget = const SizedBox.shrink();
  }

  await Get.dialog(
    AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: iconWidget),
            const SizedBox(height: 30),
            CustomAuthTitle(title: title, fontSize: 18.5),
            const SizedBox(height: 15),
            CustomSubTitle(
              subtitle: subTitle,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                fontSize: 14.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Divider(color: Colors.grey[350]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {
                      Get.back();
                      if (onCancel != null) onCancel();
                    },
                    child: Text(cancelText),
                  ),
                ),
                const SizedBox(width: 3.0),
                Expanded(
                  child: CustomPrimaryButton(
                    buttonText: confirmText,
                    height: 50,
                    bottomPadding: 0.0,
                    onPressed: () {
                      state = true;
                      Get.back();
                      if (onConfirm != null) onConfirm();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
  return state;
}
