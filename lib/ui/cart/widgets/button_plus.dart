import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ButtonPlus extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  ButtonPlus({
    required this.icon,
    this.backgroundColor = colorPrimary,
    this.iconColor = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(width: 0.5.sp, color: colorPrimary),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: 12.sp,
        color: iconColor,
      ),
    );
  }
}
