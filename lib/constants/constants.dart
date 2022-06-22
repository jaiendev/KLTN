// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

const Color colorPrimary = Color(0xFF3C4045);
const Color colorInactiveTextField = Color(0xFFF5F5F5);
const Color colorBorderTextField = Color(0xFFC5D0CF);

const colorBlack = Color(0xFF121212);
const Color colorGray1 = Color(0xFF6E6D7A);
const Color colorGray2 = Color(0xFFACACB9);
const Color colorBlack1 = Color(0xFF0D0C22);
const Color colorBlack2 = Color(0xFF3D3D4E);
const Color colorGray3 = Color(0xFFC3C2BE);
const Color colorWhite1 = Color(0xFFF5F5F5);
const Color colorHintSearch = Color(0xFF888999);
const Color backgroundDetails = Color(0xFFF5F5F5);
const colorDialogBackGround = Color(0xFFFFFFFF);
const colorDialogError = Color(0xFFE89F2F);
const Color headerCalendarColor = Color(0xFF1C4843);
const Color colorStar = Color(0xFFF5B353);
const Color colorGray4 = Color(0xFFC4C4C4);
const Color colorBlue = Color(0xFFdbf4fa);
const Color colorBlue2 = Color(0xFF0a647a);
const Color colorAddButton = Color(0xFFF0F6F6);

///Images

const String imgGoogle = 'assets/icons/ic_google.png';
const String imgFacebook = 'assets/icons/ic_facebook.png';
const String imgBegin2 = 'assets/images/img_begin_2.gif';

const String backgroundProduct = 'assets/images/background_product.png';
const String imageRegisterSuccess = 'assets/images/img_register_success.png';

///Fonts
const PTSANS = 'PTSan';

//Icons
const String iconPhoto2 = 'assets/icons/ic_photo2.png';
const String icHome = 'assets/icons/ic_home.png';
const String icCategory = 'assets/icons/ic_category.png';
const String icChat = 'assets/icons/ic_chat.png';
const String icProfile = 'assets/icons/ic_profile.png';

const String icKeyboard = 'assets/images/icon_keyboard.png';
const String icHeadphone = 'assets/images/icon_headphone.png';
const String icLaptop = 'assets/images/icon_laptop.png';
const String icMouse = 'assets/images/icon_mouse.png';
const String icScreen = 'assets/images/icon_screen.png';
const String icMemory = 'assets/images/icon_memory.png';

const String iconStar = 'assets/icons/ic_star.png';
const String iconStarGrey = 'assets/icons/ic_star_grey.png';

const String iconPhoto = 'assets/icons/icon_photo.png';
const String iconCamera = 'assets/icons/icon_camera.png';
const String iconBox = 'assets/icons/icon_box.png';
const String imageLoading = 'assets/images/img_loading.gif';
const String iconExclamationMark = 'assets/icons/ic_exclamation_mark.png';
const String iconEye = 'assets/icons/ic_eye.png';
const String iconEyeOff = 'assets/icons/ic_eye_splash.png';

const String iconRemove = 'assets/icons/ic_remove.png';
const String imgUserDefault = 'assets/images/img_user_default.png';

const DELAY_HALF_SECOND = 500;
const DURATION_DEFAULT_ANIMATION = 300;

//Nunmber
const DELAY_50_MS = 50;
const DELAY_100_MS = 100;
const DELAY_200_MS = 200;
const DELAY_250_MS = 250;
const TO_PAY = 0;
const TO_SHIP = 1;
const COMPLETE = 2;

//data fake
const String productFake = 'assets/images/img_product_fake.png';
const String urlImageMan =
    'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80';
const String urlImageProduct =
    'https://cdn-img-v2.webbnc.net/uploadv2/web/34/3492/product/2021/09/07/03/38/1630999721_9rv16aa.png_resize500x500.jpg';
const String urlImageProduct2 =
    'https://help.apple.com/assets/6062258EBFC7E7487E19DBB0/60622591BFC7E7487E19DBBA/vi_VN/540d7697864354f0c0bed1741209d7f1.png';

int get itemCountGridViewCalendar {
  return (100.w / (150.sp)).round();
}

final Widget dividerThinkness6NotMargin = Container(
  height: 6.sp,
  color: backgroundDetails,
);

final dividerColorGrey2 = Container(
  height: .5.sp,
  color: Color(0xFFACACB9),
);

final Divider dividerChat = Divider(
  color: colorPrimary,
  thickness: 0.3.sp,
  height: 0.3.sp,
);

final dividerDialog = Container(
  height: .5.sp,
  color: Color(0xFFE3E3E3),
);

const CONNECT_TIME_OUT = 5000;
const RECEIVE_TIME_OUT = 5000;
const LIMIT_RESPONSE_TIME = 200;

const INCH_TO_DP = 160;

// String Constants
const MODE_DEV = 'DEV';
const MODE_PRODUCTION = 'PRODUCTION';

// Methods
const POST = 'POST';
const GET = 'GET';
const PUT = 'PUT';
const DELETE = 'DELETE';
const PATCH = 'PATCH';

// 'url'
const HTTP_URL = 'http://';
const HTTPS_URL = 'https://';
const URL_VNPAY = 'https://evening-mountain-96387.herokuapp.com';
const VNPAY_SUCCESS = 'thanh-toan/thanh-cong';
