import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DialogWithImageTextAndPopButton extends StatelessWidget {
  const DialogWithImageTextAndPopButton({
    Key? key,
    this.title,
    this.bodyBefore,
    this.bodyAfter,
    this.highlightText,
    this.buttonText,
    this.titleColor = colorBlack1,
    this.bodyColor = colorBlack2,
    this.highlightColor = colorPrimary,
    this.titleFontSize,
    this.bodyFontSize,
    this.bodyAlign = TextAlign.justify,
    this.titleAlign = TextAlign.center,
    this.padding,
    this.route,
    this.image,
  })  : assert(
          bodyBefore != null || bodyAfter != null,
          'The body before and body after can not both be null',
        ),
        super(key: key);

  final String? title;
  final String? bodyBefore;
  final String? highlightText;
  final String? bodyAfter;
  final String? buttonText;
  final Color titleColor;
  final Color bodyColor;
  final Color highlightColor;
  final double? titleFontSize;
  final double? bodyFontSize;
  final TextAlign bodyAlign;
  final TextAlign titleAlign;
  final EdgeInsetsGeometry? padding;
  final String? route;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        color: colorDialogBackGround,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: padding ??
                EdgeInsets.only(
                  left: 16.sp,
                  right: 16.sp,
                  top: 22.sp,
                  bottom: 18.sp,
                ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                image != null
                    ? Image.asset(
                        image!,
                        width: 40.sp,
                        height: 40.sp,
                      )
                    : SizedBox(),
                image != null ? SizedBox(height: 18.sp) : SizedBox(),
                title != null
                    ? Text(
                        title!,
                        textAlign: titleAlign,
                        style: TextStyle(
                          color: titleColor,
                          fontSize: titleFontSize ?? 15.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.36,
                        ),
                      )
                    : SizedBox(),
                title != null ? SizedBox(height: 8.sp) : SizedBox(),
                RichText(
                  textAlign: bodyAlign,
                  text: TextSpan(
                    style: TextStyle(
                      color: bodyColor,
                      fontSize: bodyFontSize ?? 12.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.6,
                    ),
                    children: [
                      TextSpan(text: bodyBefore),
                      highlightText != null
                          ? TextSpan(
                              text: ' $highlightText ',
                              style: TextStyle(color: highlightColor),
                            )
                          : TextSpan(),
                      TextSpan(text: bodyAfter),
                    ],
                  ),
                ),
              ],
            ),
          ),
          dividerDialog,
          TouchableOpacity(
            onTap: () {
              AppNavigator.pop();
              route != null ? AppNavigator.push(route!) : AppNavigator.pop();
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorDialogBackGround,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.sp),
                  bottomRight: Radius.circular(12.sp),
                ),
              ),
              constraints: BoxConstraints(maxHeight: 46.sp),
              alignment: Alignment.center,
              child: Text(
                buttonText ?? 'Understood',
                style: TextStyle(
                  color: colorPrimary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
