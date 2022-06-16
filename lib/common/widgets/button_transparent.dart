import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class ButtonTransparent extends StatelessWidget {
  final Function onPressed;
  final String text;
  final FontWeight? fontWeight;
  final double? width;
  ButtonTransparent({
    required this.onPressed,
    required this.text,
    this.fontWeight,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100.w,
      child: TouchableOpacity(
        onTap: () async {
          onPressed();
        },
        child: Container(
          margin: EdgeInsets.only(
            bottom: 8.sp,
          ),
          height: 45.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.sp),
            border: Border.all(width: 1.sp, color: Colors.white),
            color: Colors.white.withOpacity(0.1),
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
