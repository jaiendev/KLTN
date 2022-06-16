import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/authenication/authenication_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/auth_form_field.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_primary.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_loading.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/constants/preload_assets.dart';
import 'package:app_kltn_trunghoan/helpers/utils/validator_utils.dart';
import 'package:app_kltn_trunghoan/models/account_remember.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordConfirmFocus = FocusNode();
  String _email = '';
  String _password = '';
  String _username = '';
  String _passwordConfirm = '';
  bool _passwordVisible = false;
  var _emailErr = 'Bạn cần nhập email!!';
  var _passErr = 'Mật khẩu phải có từ 6 kí tự';
  var _usernameErr = 'Bạn cần nhập tên người dùng';
  var _passConfirmErr = 'Mật khẩu 2 không giống mật khẩu 1';

  List<Account>? listOptions = [];
  hideKeyboard() => usernameFocus.unfocus();
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  _trySubmitForm() {
    setState(() {
      _passwordVisible = _passwordVisible;
    });
    showDialogLoading();
    AppBloc.authBloc.add(
      RegisterEvent(
        email: _email,
        password: _password,
        passwordConfirm: _passwordConfirm,
        fullname: _username,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
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
                            AuthFormField(
                              textVisible: true,
                              focusNode: usernameFocus,
                              onSubmitted: (value) => FocusScope.of(context)
                                  .requestFocus(emailFocus),
                              keyboardType: TextInputType.text,
                              hintText: 'Username',
                              onChanged: (value) => _username = value,
                              validator: (value) => value!.trim().length < 3
                                  ? _usernameErr
                                  : null,
                            ),
                            SizedBox(height: 10.sp),
                            AuthFormField(
                              textVisible: true,
                              focusNode: emailFocus,
                              onSubmitted: (_) => FocusScope.of(context)
                                  .requestFocus(passwordFocus),
                              keyboardType: TextInputType.text,
                              validator: (value) =>
                                  ValidatorUtils.isEmail(value!.trim())
                                      ? null
                                      : _emailErr,
                              hintText: 'Email',
                              onChanged: (value) => _email = value.trim(),
                            ),
                            SizedBox(height: 10.sp),
                            AuthFormField(
                              focusNode: passwordFocus,
                              keyboardType: TextInputType.text,
                              hintText: 'Password',
                              textVisible: _passwordVisible,
                              validator: (value) =>
                                  value!.trim().length < 6 ? _passErr : null,
                              suffixIcon: TouchableOpacity(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 8.sp),
                                  child: Image.asset(
                                    _passwordVisible ? iconEye : iconEyeOff,
                                    width: 16.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              onChanged: (value) => _password = value.trim(),
                            ),
                            SizedBox(height: 10.sp),
                            AuthFormField(
                              focusNode: passwordFocus,
                              keyboardType: TextInputType.text,
                              hintText: 'Confirm Password',
                              textVisible: _passwordVisible,
                              validator: (value) => value!.trim().length < 6
                                  ? _passErr
                                  : value.trim().toUpperCase() !=
                                          _password.toUpperCase()
                                      ? _passConfirmErr
                                      : null,
                              suffixIcon: TouchableOpacity(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 8.sp),
                                  child: Image.asset(
                                    _passwordVisible ? iconEye : iconEyeOff,
                                    width: 16.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              onChanged: (value) =>
                                  _passwordConfirm = value.trim(),
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
                                          color: colorBlack1,
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
                                      color: colorBlack1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 30.sp),
                            ButtonPrimary(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _trySubmitForm();
                                }
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
      ),
    );
  }
}
