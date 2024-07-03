import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:flutter/cupertino.dart';

class PreviewNoteText extends StatelessWidget {
  const PreviewNoteText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CustomAuthTitle(
          fontSize: 18,
          title: "Please confirm & submit your order",
          color: AppColor.appBarColord,
        ),
        SizedBox(height: 10.0),
        CustomSubTitle(
          subtitle: "by clicking submit, you agree fintory's Terms of Use and Privacy Policy",
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
