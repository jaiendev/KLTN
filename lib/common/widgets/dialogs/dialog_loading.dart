import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

showDialogLoading() {
  showDialog(
    context: AppNavigator.context!,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Image.asset(
            imageLoading,
            height: 100.sp,
            width: 100.sp,
            fit: BoxFit.fitWidth,
            color: colorPrimary,
          ),
        ),
      );
    },
    barrierColor: Color(0x80000000),
    barrierDismissible: false,
  );
}
