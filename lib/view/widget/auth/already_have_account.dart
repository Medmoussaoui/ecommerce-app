import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AreadyHaveAccount extends StatelessWidget {
  const AreadyHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'I already have an account  ',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColor.grey.withOpacity(0.4),
            fontSize: 14.0,
          ),
        ),
        Text(
          'Sign In',
          style: TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.w600,
            color: AppColor.primaryColor,
          ),
        )
      ],
    );
  }
}
