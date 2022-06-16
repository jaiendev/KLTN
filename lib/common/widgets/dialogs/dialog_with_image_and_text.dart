import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class DialogWithImageAndText extends StatelessWidget {
  final String text;
  final Image image;
  final EdgeInsetsGeometry? padding;
  final Color? textColor;
  final double? textFontSize;

  const DialogWithImageAndText({
    Key? key,
    required this.text,
    required this.image,
    this.padding,
    this.textColor = colorPrimary,
    this.textFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 100.w),
      width: 100.w,
      padding:
          padding ?? EdgeInsets.symmetric(vertical: 24.sp, horizontal: 50.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          image,
          SizedBox(height: 18.sp),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: textFontSize ?? 13.sp,
              fontWeight: FontWeight.w400,
              height: 1.25.sp,
            ),
          ),
        ],
      ),
    );
  }
}
