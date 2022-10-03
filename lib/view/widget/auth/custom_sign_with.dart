import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/view/widget/auth/custom_social_media_icon.dart';
import 'package:flutter/cupertino.dart';

class CustomSignWith extends StatelessWidget {
  const CustomSignWith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomSocialMediaIcon(iconPath: AppImageAsset.facebook),
        const SizedBox(width: 25),
        CustomSocialMediaIcon(iconPath: AppImageAsset.google, onPressed: () {}),
      ],
    );
  }
}
