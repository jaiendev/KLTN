import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_wrapper.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

Future<void> showAlertDialogFullScreenOneButton({
  required String title,
  required String content,
  required String textButton,
  required Function onPressedButton,
  required BuildContext context,
}) {
  return dialogAnimationWrapper(
      child: Container(
    constraints: BoxConstraints(maxWidth: double.infinity),
    width: double.infinity,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 18.sp),
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: colorBlack1,
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
            ),
          ),
        ),
        SizedBox(
          height: 8.sp,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Text('$content',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: colorBlack2, height: 1.25.sp, fontSize: 12.sp)),
        ),
        SizedBox(height: 16.sp),
        dividerChat,
        TouchableOpacity(
          onTap: () {
            onPressedButton();
            AppNavigator.pop();
          },
          child: Container(
            width: double.infinity,
            height: 40.sp,
            color: Colors.transparent,
            child: Center(
              child: Text(
                textButton,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: colorPrimary,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ));
}
