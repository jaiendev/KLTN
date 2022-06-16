import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class ButtonPlus extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Function onTap;
  ButtonPlus({
    required this.icon,
    this.backgroundColor = colorPrimary,
    this.iconColor = Colors.white,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
