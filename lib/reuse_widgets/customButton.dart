
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AppColors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  final Color? textColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final IconData? icon;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color,
      this.textColor,
      this.width,
      this.height,
      this.borderRadius,
      this.fontSize,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: InkWell(
        onTap: onPressed,
        child: Container(
            width: width ?? double.infinity,
            height: height ?? 40.h,
            decoration: BoxDecoration(
                color: color ?? AppColors.primaryColor,
                borderRadius: BorderRadius.circular(22.r)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    text,
                    style: TextStyle(color: textColor ?? Colors.white,fontSize: fontSize
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
