import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData englishTheme = ThemeData(
    fontFamily: "Figtree",
    scaffoldBackgroundColor: Colors.white,
    colorScheme:
        ThemeData().colorScheme.copyWith(primary: AppColor.primaryColor),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 20.0,
        color: AppColor.blackGrey,
      ),
      headlineLarge: TextStyle(
        fontSize: 20.0,
        color: AppColor.blackGrey,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontSize: 17.5,
        color: AppColor.blackGrey,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColor.grey.withOpacity(0.4),
        fontSize: 13.5,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColor.grey.withOpacity(0.4),
        fontSize: 14.5,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15.5,
        color: AppColor.grey.withOpacity(0.5),
      ),
    ),
    primaryColor: AppColor.primaryColor,
  );

  static final ThemeData arabicTheme = ThemeData(
    fontFamily: "Cairo",
    scaffoldBackgroundColor: Colors.white,
    colorScheme:
        ThemeData().colorScheme.copyWith(primary: AppColor.primaryColor),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 20.0,
        color: AppColor.blackGrey,
      ),
      headlineLarge: TextStyle(
        fontSize: 20.0,
        color: AppColor.blackGrey,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontSize: 17.5,
        color: AppColor.blackGrey,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColor.grey.withOpacity(0.4),
        fontSize: 13.0,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColor.grey.withOpacity(0.4),
        fontSize: 13.7,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15.0,
        color: AppColor.grey.withOpacity(0.5),
      ),
    ),
    primaryColor: AppColor.primaryColor,
  );
}
