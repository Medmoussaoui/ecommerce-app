import 'package:ecommercecourse/controller/checkOut/Success/index.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ThanksMessage extends StatefulWidget {
  const ThanksMessage({Key? key}) : super(key: key);

  @override
  State<ThanksMessage> createState() => _ThanksMessageState();
}

class _ThanksMessageState extends State<ThanksMessage> with SingleTickerProviderStateMixin {
  late SuccessOrderScreenController controller;
  late AnimationController _animationController;
  late Animation<double> _opacityOne;
  late Animation<double> _opacityTwo;
  late Animation<double> _movey;
  late Animation<double> _movex;

  @override
  void initState() {
    controller = Get.find();
    _animationController = controller.animation.getInstance();

    _opacityOne = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0),
      ),
    )..addListener(() => setState(() {}));

    _opacityTwo = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0),
      ),
    )..addListener(() => setState(() {}));

    _movex = Tween(begin: -100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 1.0, curve: Curves.elasticOut),
      ),
    )..addListener(() => setState(() {}));

    _movey = Tween(begin: -20.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0),
      ),
    )..addListener(() => setState(() {}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        Transform.translate(
          offset: Offset(_movex.value, 0.0),
          child: Opacity(
            opacity: _opacityOne.value,
            child: Image.asset(AppImageAsset.like, height: 100),
          ),
        ),
        const Spacer(flex: 3),
        Opacity(
          opacity: _opacityTwo.value,
          child: Transform.translate(
            offset: Offset(0.0, _movey.value),
            child: const CustomAuthTitle(title: "Thanks, For your  order"),
          ),
        ),
        const SizedBox(height: 20),
        Opacity(
          opacity: _opacityTwo.value,
          child: Transform.translate(
            offset: Offset(0.0, _movey.value),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: CustomSubTitle(subtitle: "you order has been successfully completed you will revieved your order in \n 48 hours"),
            ),
          ),
        ),
      ],
    );
  }
}
