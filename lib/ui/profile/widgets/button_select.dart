import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class ButtonSelect extends StatelessWidget {
  final IconData icon;
  final String content;
  final VoidCallback handlePressed;
  ButtonSelect({
    required this.icon,
    required this.content,
    required this.handlePressed,
  });

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: handlePressed,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(
          vertical: 16.sp,
          horizontal: 16.sp,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18.sp,
            ),
            SizedBox(width: 14.sp),
            Text(
              content,
              style: TextStyle(
                color: colorBlack2,
                fontSize: 13.sp,
              ),
            ),
            Spacer(),
            Icon(
              PhosphorIcons.caret_right_light,
              size: 18.sp,
            )
          ],
        ),
      ),
    );
  }
}
