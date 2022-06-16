import 'package:app_kltn_trunghoan/common/widgets/button_transparent.dart';
import 'package:app_kltn_trunghoan/constants/preload_assets.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({Key? key}) : super(key: key);

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {
  @override
  void initState() {
    super.initState();
    PreloadAssets.initialLoad();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage('assets/images/img_begin.png'), context);
    precacheImage(AssetImage('assets/images/img_login_2.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0.0,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.black,
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            PreloadAssets.imgBegin,
            Column(
              children: [
                SizedBox(height: 40.sp),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Text(
                    'Affordable and quality accessories for your PC',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.25.sp,
                    ),
                  ),
                ),
                SizedBox(height: 100.sp),
              ],
            ),
            Container(
              height: 100.h,
              width: 100.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonTransparent(
                    width: 75.w,
                    onPressed: () async {
                      await precacheImage(
                          AssetImage('assets/images/img_login_2.png'), context);
                      AppNavigator.push(
                        Routes.LOGIN,
                      );
                    },
                    text: 'Get Started',
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 30.sp),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
