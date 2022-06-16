import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class TitleTextField extends StatelessWidget {
  final String title;
  final String option;
  final VoidCallback? handlePressed;
  final EdgeInsetsGeometry? padding;
  TitleTextField(
      {required this.title,
      this.option = '',
      this.handlePressed,
      this.padding});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.only(
            top: 12.sp,
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12.5.sp,
              fontWeight: FontWeight.w600,
              color: colorBlack2,
            ),
          ),
          TouchableOpacity(
            onTap: handlePressed,
            child: Text(
              option,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: colorPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
