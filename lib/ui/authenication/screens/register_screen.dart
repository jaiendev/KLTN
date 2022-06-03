import 'package:app_kltn_trunghoan/common/widgets/button_primary.dart';
import 'package:app_kltn_trunghoan/common/widgets/text_field_form.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/constants/preload_assets.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 15.sp),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
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
                            hintText: 'Username',
                          ),
                          TextFieldForm(
                            validatorForm: null,
                            hintText: 'Email',
                          ),
                          TextFieldForm(
                            validatorForm: null,
                            hintText: 'Password',
                          ),
                          TextFieldForm(
                            validatorForm: null,
                            hintText: 'Confirm Password',
                          ),
                          SizedBox(height: 30.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'By selecting Agree and continue below,',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'I agree to ',
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          'Term of Service and Privary Policy',
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: colorPrimary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Already have an Account? ',
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
                                  AppNavigator.pop();
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 13.5.sp,
                                    color: colorPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 30.sp),
                          ButtonPrimary(
                            onPressed: () {
                              AppNavigator.push(Routes.HOME);
                            },
                            text: 'Agree and continue',
                          )
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
