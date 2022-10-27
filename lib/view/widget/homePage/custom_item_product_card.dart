import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:flutter/material.dart';

class CustomItemProductCard extends StatelessWidget {
  final bool isFavorate;

  const CustomItemProductCard({Key? key, this.isFavorate = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            spreadRadius: 1.5,
            color: Colors.grey.withOpacity(0.1),
          )
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              /// Prouct Picture
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://consumer.huawei.com/content/dam/huawei-cbg-site/common/mkt/plp/laptops/matebook-d-16-list.png"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),

              /// Title and description
              const SizedBox(height: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAuthTitle(
                      title: 'Pants born',
                      fontSize: 15,
                    ),
                    const SizedBox(height: 3.0),
                    CustomSubTitle(
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.normal),
                      subtitle: "extra size and hight find more",
                      textAlign: TextAlign.start,
                    ),
                    const Spacer(),

                    /// Price And Arrow Button
                    Row(
                      children: [
                        Text(
                          "\$45.0",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: AppColor.secondryColor,
                                  fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        ClipOval(
                          child: Material(
                            color: AppColor.secondryColor,
                            child: InkWell(
                              splashColor: Colors.grey[200],
                              onTap: () {},
                              child: const SizedBox(
                                width: 34,
                                height: 34,
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                  size: 16.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// Favorate Icon
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.favorite_rounded,
              color: isFavorate ? Colors.red : Colors.grey[200],
            ),
          )
        ],
      ),
    );
  }
}
