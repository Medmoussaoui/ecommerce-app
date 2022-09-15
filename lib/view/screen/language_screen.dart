import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/localization/locale_controller.dart';
import 'package:ecommercecourse/view/widget/Languange/custom_lang_subtitle.dart';
import 'package:ecommercecourse/view/widget/Languange/custom_lange_title.dart';
import 'package:ecommercecourse/view/widget/Languange/custom_preferred_lang_list.dart';
import 'package:ecommercecourse/view/widget/languange/custom_skip_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<LocaleController> {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSkipButton(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppImageAsset.language, width: 80.0),
                  const SizedBox(height: 50),
                  const CustomLangTitle(),
                  const SizedBox(height: 5.0),
                  const CustomLangSubtitle(),
                ],
              ),
            ),
            const Expanded(
              child: CustomPreferredLanguageList(),
            ),
          ],
        ),
      ),
    );
  }
}
