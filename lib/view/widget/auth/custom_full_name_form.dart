import 'package:ecommercecourse/controller/sign_up_controller.dart';
import 'package:ecommercecourse/view/widget/auth/custom_text_form_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomFullNameForm extends GetView<SignUpController> {
  const CustomFullNameForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormAuth(
            controller: controller.firstNameController,
            hintText: 'First name',
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: CustomTextFormAuth(
            controller: controller.lastNameController,
            hintText: 'Last name',
          ),
        ),
      ],
    );
  }
}
