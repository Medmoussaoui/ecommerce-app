import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/view/widget/auth/custom_circule_icon.dart';
import 'package:flutter/cupertino.dart';

class CustomSignWith extends StatelessWidget {
  const CustomSignWith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CustomCirculIcon(iconPath: AppImageAsset.facebook),
        SizedBox(width: 25),
        CustomCirculIcon(iconPath: AppImageAsset.google),
      ],
    );
  }
}
