import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/already_have_account.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sign_with.dart';
import 'package:ecommercecourse/view/widget/auth/custom_or_divider.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[50],
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0.0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Column(
            children: const [
              CustomAuthTitle(title: "Welcome To\n Yalavex"),
              SizedBox(height: 30),
              CustomSubTitle(
                  subtitle:
                      'Enjoy yalavex you can buy any thing from any where you like in the world with fast shipping like never beffore'),
              Spacer(),
              CustomPrimaryButton(buttonText: 'Create an Account'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: CustomOrDivider(text: 'or Sign Up with'),
              ),
              CustomSignWith(),
              SizedBox(height: 20),
              AreadyHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
