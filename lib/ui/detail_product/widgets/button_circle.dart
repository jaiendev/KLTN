import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class ButtonCircle extends StatelessWidget {
  final Color? backgroundColor;
  final Color? iconColor;
  final double? sizeIcon;
  final EdgeInsetsGeometry? padding;
  final IconData? icon;
  final List<BoxShadow>? boxShadow;
  final Function(bool?) onTap;
  final bool isCheck;
  ButtonCircle({
    this.backgroundColor,
    this.iconColor,
    this.sizeIcon,
    this.padding,
    this.icon,
    this.boxShadow,
    required this.onTap,
    this.isCheck = false,
  });
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        onTap(isCheck);
      },
      child: Container(
        padding: EdgeInsets.all(7.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: boxShadow ??
              [
                BoxShadow(
                  color: backgroundColor ?? Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
        ),
        child: Icon(
          isCheck ? PhosphorIcons.heart_fill : icon ?? PhosphorIcons.heart_bold,
          size: sizeIcon ?? 25.sp,
          color: isCheck ? Colors.redAccent : iconColor ?? colorPrimary,
        ),
      ),
    );
  }
}
