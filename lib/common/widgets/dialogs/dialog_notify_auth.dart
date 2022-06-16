import 'package:app_kltn_trunghoan/common/widgets/button_primary.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class DialogNotifyAuth extends StatelessWidget {
  final String email;
  final String content;
  final Image? image;
  final String title1;
  final String title2;
  final String buttonTitle;

  const DialogNotifyAuth({
    Key? key,
    required this.email,
    required this.content,
    required this.image,
    required this.title1,
    required this.title2,
    required this.buttonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 200),
        margin: EdgeInsets.only(left: 20.sp, right: 20.sp),
        color: Colors.white,
        child: Column(
          children: [
            image ?? SizedBox(),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: colorBlack1,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: colorBlack2,
                  ),
                ),
                Expanded(
                  child: Text(
                    email,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: colorPrimary,
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: TextStyle(
                  height: 1.25.sp,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: title2,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: colorBlack2,
                    ),
                  ),
                  TextSpan(
                    text: '\t',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: colorBlack2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.sp,
            ),
            ButtonPrimary(
              onPressed: () {
                AppNavigator.pop();
              },
              text: buttonTitle,
            )
          ],
        ),
      ),
    );
  }
}
