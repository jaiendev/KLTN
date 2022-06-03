import 'package:app_kltn_trunghoan/common/widgets/button_primary.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Empty extends StatelessWidget {
  const Empty({
    Key? key,
    this.hasButton = false,
    this.buttonText = '',
    this.buttonOnPressed,
    required this.image,
    required this.text,
    this.backgroundColor,
  }) : super(key: key);

  final Image image;
  final String text;
  final bool hasButton;
  final String buttonText;
  final Function? buttonOnPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          image,
          SizedBox(height: 26.sp),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              height: 1.625,
              color: colorBlack2,
            ),
          ),
          SizedBox(height: hasButton ? 34.sp : 0),
          hasButton
              ? ButtonPrimary(
                  onPressed: buttonOnPressed!,
                  text: buttonText,
                )
              : SizedBox(),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
