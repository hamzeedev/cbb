import 'package:flutter/material.dart';
import '../../../res/colors/AppColors.dart';

class AccountBtn extends StatelessWidget {
  const AccountBtn(
      {super.key,
        this.height = 45,
        this.width = 100,
        this.radius = 20,
        this.txt = '',
        this.loading = false,
        this.onTap,
        this.outline = false,
        this.color,
        this.outlineColor,
        this.textColor});

  final double height;
  final double width;
  final double radius;
  final String txt;
  final Color? textColor;
  final bool loading;
  final VoidCallback? onTap;
  final bool outline;
  final Color? color;
  final Color? outlineColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:loading?null:onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color ?? AppColors.primaryColor,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 2)],
            border: outline
                ? Border.all(width: 2, color: outlineColor ?? Colors.white)
                : null),
        child: loading
            ? SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: textColor ?? Colors.white,
          ),
        )
            : Text(
          txt,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}