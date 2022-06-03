import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ButtonPrimary extends StatelessWidget {
  final Function onPressed;
  final String text;
  final FontWeight? fontWeight;
  final double? width;
  final EdgeInsets? padding;
  final double? height;

  ButtonPrimary({
    required this.onPressed,
    required this.text,
    this.fontWeight,
    this.width,
    this.padding,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      child: TouchableOpacity(
        onTap: () async {
          onPressed();
        },
        child: Container(
          margin: EdgeInsets.only(
            bottom: 8.sp,
          ),
          padding: padding ?? null,
          height: height ?? 36.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.5.sp),
            color: colorPrimary,
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
