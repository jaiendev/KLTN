import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class CupertinoDialog extends StatelessWidget {
  final String title;
  final String description;
  final String primaryText;
  final String secondaryText;
  final Function handlePressedPrimary;

  const CupertinoDialog({
    required this.title,
    required this.description,
    required this.primaryText,
    required this.handlePressedPrimary,
    this.secondaryText = 'Huỷ',
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: TextStyle(
          color: colorBlack1,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Padding(
        padding: EdgeInsets.only(top: 4.sp),
        child: Text(
          description,
          style: TextStyle(
            color: colorBlack2,
          ),
        ),
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(
            secondaryText,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () => AppNavigator.pop(),
        ),
        CupertinoDialogAction(
          child: Text(
            primaryText,
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () {
            AppNavigator.pop();
            handlePressedPrimary();
          },
        ),
      ],
    );
  }
}
