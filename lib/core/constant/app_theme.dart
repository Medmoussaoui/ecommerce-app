import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData englishTheme = ThemeData(
    fontFamily: "Figtree",
    scaffoldBackgroundColor: Colors.grey[100],
    colorScheme: ThemeData().colorScheme.copyWith(primary: AppColor.primaryColor),
    appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: AppColor.appBarColord)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 20.0,
        color: AppColor.blackGrey,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontSize: 18.5,
        color: AppColor.blackGrey,
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
        fontWeight: FontWeight.w500,
        color: AppColor.grey.withOpacity(0.4),
        fontSize: 14.7,
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
    scaffoldBackgroundColor: Colors.grey[100],
    colorScheme: ThemeData().colorScheme.copyWith(primary: AppColor.primaryColor),
    appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: AppColor.grey)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.white),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 17.5,
        color: AppColor.blackGrey,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w500,
        color: AppColor.blackGrey,
      ),
      headlineSmall: TextStyle(
        fontSize: 16.0,
        color: AppColor.blackGrey,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColor.grey.withOpacity(0.4),
        fontSize: 12.5,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColor.grey.withOpacity(0.49),
        fontSize: 14.0,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14.5,
        color: AppColor.grey.withOpacity(0.5),
      ),
    ),
    primaryColor: AppColor.primaryColor,
  );
}
