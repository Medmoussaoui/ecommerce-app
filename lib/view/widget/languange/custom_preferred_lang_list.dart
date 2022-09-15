import 'package:ecommercecourse/data/source/static/preferred_language_data.dart';
import 'package:ecommercecourse/view/widget/languange/custom_lang_button.dart';
import 'package:flutter/material.dart';

class CustomPreferredLanguageList extends StatelessWidget {
  const CustomPreferredLanguageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: preferredLanguages.length,
      itemBuilder: (BuildContext context, i) {
        return CustomLangButton(
          langIcon: preferredLanguages[i].langIcon,
          langecode: preferredLanguages[i].langName,
        );
      },
    );
  }
}
