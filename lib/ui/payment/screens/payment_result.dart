import 'package:app_kltn_trunghoan/common/widgets/button_primary.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class PaymentResultScreen extends StatelessWidget {
  const PaymentResultScreen({
    Key? key,
    required this.isSuccess,
    this.isCheckChatScreen = false,
  }) : super(key: key);

  final bool isSuccess;
  final bool isCheckChatScreen;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Theme.of(context).brightness,
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Kết quả giao dịch',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: colorBlack2,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 26.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   imagePaymentSuccess,
                    //   height: 82.sp,
                    //   width: 125.sp,
                    // ),
                    SizedBox(height: 4.93.h),
                    Text(
                      isSuccess
                          ? 'Thanh toán thành công'
                          : 'Thanh toán thất bại',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17.sp,
                        height: 1.364,
                        color: colorBlack1,
                      ),
                    ),
                    SizedBox(height: 2.46.h),
                    Text(
                      isSuccess
                          ? 'Thanh toán thành công'
                          : 'Thanh toán thất bại',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        height: 1.6,
                        color: colorBlack2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: 28.sp, left: 16.sp, right: 16.sp),
              child: ButtonPrimary(
                onPressed: () {
                  AppNavigator.popUntil(Routes.HOME);
                },
                text: 'Về trang chủ',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
