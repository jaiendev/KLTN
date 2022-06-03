import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColorItem extends StatelessWidget {
  final Color color;
  final bool isCheck;
  final Function onTap;

  ColorItem({required this.color, this.isCheck = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        padding: EdgeInsets.all(5.sp),
        child: Container(
          height: 12.sp,
          width: 12.sp,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCheck ? Colors.white : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
