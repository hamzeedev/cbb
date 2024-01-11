import 'package:cbb/res/colors/AppColors.dart';
import 'package:cbb/res/texts/app_text_styles.dart';
import 'package:flutter/material.dart';

class Heading1Text extends StatelessWidget {
  final String text;
  TextStyle? textStyle;

  // Constructor with default TextStyle
  Heading1Text(this.text, {super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          AppTextStyles
              .heading1WhiteTextStyle, // Use custom style if provided, else use defaultTextStyle
    );
  }

  // Default TextStyle
}

class Heading2Text extends StatelessWidget {
  final String text;
  TextStyle? textStyle;

  // Constructor with default TextStyle
  Heading2Text(this.text, {super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          AppTextStyles
              .heading2TextStyle, // Use custom style if provided, else use defaultTextStyle
    );
  }
}

class AppBarText extends StatelessWidget {
  final String text;
  TextStyle? textStyle;

  // Constructor with default TextStyle
  AppBarText(this.text, {super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          AppTextStyles
              .appBarTextStyle, // Use custom style if provided, else use defaultTextStyle
    );
  }
}

class NormalBlackText extends StatelessWidget {
  final String text;
  TextStyle? textStyle;

  // Constructor with default TextStyle
  NormalBlackText(this.text, {super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          AppTextStyles
              .normalTextStyle, // Use custom style if provided, else use defaultTextStyle
    );
  }
}

class NormalWhiteText extends StatelessWidget {
  final String text;
  TextStyle? textStyle;

  // Constructor with default TextStyle
  NormalWhiteText(this.text, {super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          AppTextStyles.normalTextStyle.copyWith(
              color: AppColors
                  .whiteColor), // Use custom style if provided, else use defaultTextStyle
    );
  }
}

class AuthLabelTexts extends StatelessWidget {
  final String text;
  TextStyle? textStyle;

  // Constructor with default TextStyle
  AuthLabelTexts(this.text, {super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          AppTextStyles.heading2TextStyle.copyWith(fontWeight: FontWeight.w400),
    );
  }
}
