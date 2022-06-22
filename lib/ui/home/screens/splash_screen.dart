import 'package:app_kltn_trunghoan/common/widgets/appbars/appbar_none.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBrighnessDark(brightness: Brightness.light),
      body: Container(
        width: 100.w,
        height: 100.h,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/flash_screen.gif',
              height: 100.sp,
              width: 100.sp,
              fit: BoxFit.fitWidth,
              color: colorPrimary,
            )
          ],
        ),
      ),
    );
  }
}
