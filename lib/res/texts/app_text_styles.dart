import 'package:cbb/res/colors/AppColors.dart';
import 'package:flutter/material.dart';

var inter = "Inter";

class AppTextStyles {
  static TextStyle heading1WhiteTextStyle = TextStyle(
    fontSize: 25.0,
    letterSpacing: 1.5,
    color: AppColors.whiteColor,

    fontFamily: inter,
    fontWeight: FontWeight.bold,
    // Add more default styles as needed
  );
  static TextStyle heading1BlackTextStyle = TextStyle(
    fontSize: 25.0,
    letterSpacing: 1.5,
    color: AppColors.blackColor,

    fontFamily: inter,
    fontWeight: FontWeight.bold,
    // Add more default styles as needed
  );
  static TextStyle heading2TextStyle = TextStyle(
    fontSize: 18.0,
    color: Colors.black,
    fontFamily: inter,
    fontWeight: FontWeight.bold,
    // Add more default styles as needed
  );
  static TextStyle appBarTextStyle = TextStyle(
    fontSize: 30.0,
    color: AppColors.whiteColor,
    fontFamily: inter,
    fontWeight: FontWeight.bold,

    // Add more default styles as needed
  );
  static TextStyle normalTextStyle = TextStyle(
    fontSize: 14.0,
    color: Colors.black,
    fontFamily: inter,

    // Add more default styles as needed
  );
  static TextStyle normalBlueTextStyle = TextStyle(
    fontSize: 14.0,
    color: AppColors.primaryColor,

    fontFamily: inter,

    // Add more default styles as needed
  );

  static TextStyle heading2BlueColorTextStyle = TextStyle(
    fontSize: 18.0,
    color: AppColors.primaryColor,
    fontFamily: inter,
    fontWeight: FontWeight.bold,

    // Add more default styles as needed
  );
  static const TextStyle captionTextStyle = TextStyle(
    fontSize: 13.0,
    color: Colors.black,
    // Add more default styles as needed
  );
}
