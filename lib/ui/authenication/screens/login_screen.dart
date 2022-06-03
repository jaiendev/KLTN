import 'package:app_kltn_trunghoan/common/widgets/auth_method_button.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_primary.dart';
import 'package:app_kltn_trunghoan/common/widgets/text_field_form.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/constants/preload_assets.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Stack(
            children: [
              PreloadAssets.imgLogin,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  children: [
                    SizedBox(height: 40.sp),
                    TouchableOpacity(
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 100.h,
                width: 100.w,
                padding:
                    EdgeInsets.symmetric(vertical: 20.sp, horizontal: 8.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 15.sp),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.sp,
                        vertical: 16.sp,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFieldForm(
                            validatorForm: null,
                            hintText: 'Email',
                          ),
                          TextFieldForm(
                            validatorForm: null,
                            hintText: 'Password',
                          ),
                          SizedBox(height: 30.sp),
                          ButtonPrimary(
                            onPressed: () {
                              AppNavigator.push(Routes.HOME);
                            },
                            text: 'Continue',
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 8.sp),
                          Text(
                            'Or',
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.sp),
                          ),
                          SizedBox(height: 8.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AuthMethodButton(
                                imageSize: Size(17.5.sp, 17.5.sp),
                                onTap: () {},
                                image: imgGoogle,
                              ),
                              AuthMethodButton(
                                imageSize: Size(9.5.sp, 17.5.sp),
                                onTap: () {},
                                image: imgFacebook,
                              ),
                            ],
                          ),
                          SizedBox(height: 15.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Don\'t have an account? ',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 2.sp,
                              ),
                              TouchableOpacity(
                                onTap: () {
                                  AppNavigator.push(Routes.REGISTER);
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 13.5.sp,
                                    color: colorBlack1,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Forgot your password?',
                                style: TextStyle(
                                  fontSize: 13.5.sp,
                                  color: colorBlack1,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.sp),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
