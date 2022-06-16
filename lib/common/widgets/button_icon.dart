import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class ButtonIcon extends StatelessWidget {
  final IconData? icon;
  final Function onHandlePressed;
  final double? size;
  final Color? backgroundColor;
  final Color? colorIcon;
  const ButtonIcon({
    required this.icon,
    required this.onHandlePressed,
    this.size,
    this.backgroundColor,
    this.colorIcon,
  });
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onHandlePressed,
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: backgroundColor ?? colorWhite1,
        ),
        child: Icon(
          icon,
          size: size ?? 20.sp,
          color: colorIcon ?? colorPrimary,
        ),
      ),
    );
  }
}
