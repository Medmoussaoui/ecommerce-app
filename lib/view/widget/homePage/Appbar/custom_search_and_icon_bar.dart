import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomHomePageSeachFormAndNorificationIconAppBar extends StatelessWidget {
  const CustomHomePageSeachFormAndNorificationIconAppBar({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Seach Form
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(right: 5.0),
            height: 55,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Find our products',
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: AppColor.blackGrey,
                ),
              ),
            ),
          ),
        ),

        /// Notification Icon
        const SizedBox(width: 15),
        MaterialButton(
          height: 55,
          minWidth: 50,
          elevation: 0.0,
          highlightElevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          color: Colors.grey[200],
          child: const Icon(
            Icons.notifications_none_rounded,
            color: AppColor.grey,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
