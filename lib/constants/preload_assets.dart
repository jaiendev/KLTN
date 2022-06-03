import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class PreloadAssets {
  static late Image imgBegin;
  static late Image imgLogin;
  static initialLoad() {
    imgBegin = Image.asset(
      'assets/images/img_begin.png',
      height: 100.h,
      width: 100.w,
      fit: BoxFit.cover,
      gaplessPlayback: true,
    );

    imgLogin = Image.asset(
      'assets/images/img_login_2.png',
      height: 100.h,
      width: 100.w,
      fit: BoxFit.cover,
      gaplessPlayback: true,
    );
  }

  ///Singleton factory
  static final PreloadAssets _instance = PreloadAssets._internal();

  factory PreloadAssets() {
    return _instance;
  }

  PreloadAssets._internal();
}
