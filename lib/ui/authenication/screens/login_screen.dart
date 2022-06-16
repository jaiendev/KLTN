import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/authenication/authenication_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/auth_form_field.dart';
import 'package:app_kltn_trunghoan/common/widgets/auth_method_button.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_primary.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_loading.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/constants/preload_assets.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:app_kltn_trunghoan/helpers/utils/validator_utils.dart';
import 'package:app_kltn_trunghoan/models/account_remember.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  final _controllerEmail = TextEditingController();
  final _controllerPass = TextEditingController();
  String _email = '';
  String _password = '';
  bool _isRemember = true;
  bool _passwordVisible = false;
  var _emailErr = 'Bạn cần nhập email!!';
  var _passErr = 'Mật khẩu phải có từ 6 kí tự';
  List<Account>? listOptions = [];
  hideKeyboard() => usernameFocus.unfocus();
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    listOptions = UserLocal().getAccountRemember() != null
        ? UserLocal().getAccountRemember()!.account
        : <Account>[];
  }

  Future<void> _trySubmitForm() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      setState(() {
        _passwordVisible = _passwordVisible;
      });
      showDialogLoading();
      AppBloc.authBloc.add(
        LoginEvent(
          isRemember: _isRemember,
          email: _email,
          password: _password,
        ),
      );
    }
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
                            RawAutocomplete<Account>(
                              textEditingController: _controllerEmail,
                              focusNode: usernameFocus,
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
                                return listOptions!
                                    .where((Account county) => county.email
                                        .toLowerCase()
                                        .startsWith(textEditingValue.text
                                            .toLowerCase()))
                                    .toList();
                              },
                              displayStringForOption: (Account option) =>
                                  option.email,
                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController
                                      fieldTextEditingController,
                                  FocusNode fieldFocusNode,
                                  VoidCallback onFieldSubmitted) {
                                return AuthFormField(
                                  controller: fieldTextEditingController,
                                  textVisible: true,
                                  focusNode: usernameFocus,
                                  // usernameFocus,
                                  onSubmitted: (value) => FocusScope.of(context)
                                      .requestFocus(passwordFocus),
                                  keyboardType: TextInputType.text,
                                  hintText: 'Email',
                                  onChanged: (value) => _email = value.trim(),
                                  validator: (value) =>
                                      ValidatorUtils.isEmail(value!.trim())
                                          ? null
                                          : _emailErr,
                                );
                              },
                              onSelected: (Account selection) {},
                              optionsViewBuilder: (BuildContext context,
                                  AutocompleteOnSelected<Account> onSelected,
                                  Iterable<Account> options) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: Material(
                                    child: Container(
                                      width: 100.w - 38.sp,
                                      height: options.length <= 3
                                          ? 52.sp * options.length
                                          : 180.sp,
                                      margin: EdgeInsets.only(top: 5.sp),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.sp)),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(-1, -1),
                                            color: Colors.black.withOpacity(.1),
                                            blurRadius: 1,
                                          ),
                                          BoxShadow(
                                            offset: Offset(2, 2),
                                            color: Colors.black.withOpacity(.2),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        padding: EdgeInsets.all(10.sp),
                                        itemCount: options.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final Account option =
                                              options.elementAt(index);
                                          return TouchableOpacity(
                                            onTap: () {
                                              onSelected(option);
                                              _email = option.email;
                                              _password = option.password;
                                              _controllerPass.text =
                                                  option.password;
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                              child: Column(
                                                children: [
                                                  index > 0
                                                      ? Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      8.sp),
                                                          child: dividerChat,
                                                        )
                                                      : SizedBox(),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              option.email,
                                                              style: TextStyle(
                                                                color:
                                                                    colorBlack1,
                                                                fontSize: 12.sp,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 4.sp),
                                                            Text(
                                                              '***********',
                                                              style: TextStyle(
                                                                color:
                                                                    colorGray1,
                                                                fontSize: 12.sp,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      TouchableOpacity(
                                                        onTap: () {
                                                          UserLocal()
                                                              .deleteAccountRemember(
                                                                  option.email);

                                                          int indexOfOptions =
                                                              listOptions?.indexWhere((opt) =>
                                                                      opt.email ==
                                                                      option
                                                                          .email) ??
                                                                  -1;

                                                          if (indexOfOptions !=
                                                              -1) {
                                                            listOptions?.removeAt(
                                                                indexOfOptions);
                                                            setState(() {
                                                              _controllerEmail
                                                                  .text = '';
                                                            });
                                                          }
                                                        },
                                                        child: Icon(
                                                          Icons.close,
                                                          size: 18.sp,
                                                          color: colorGray2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            AuthFormField(
                              controller: _controllerPass,
                              focusNode: passwordFocus,
                              onSubmitted: (_) async {
                                await _trySubmitForm();
                              },
                              keyboardType: TextInputType.text,
                              hintText: 'Password',
                              textVisible: _passwordVisible,
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
                              validator: (value) =>
                                  value!.trim().length < 6 ? _passErr : null,
                              onChanged: (value) => _password = value.trim(),
                            ),
                            SizedBox(height: 30.sp),
                            ButtonPrimary(
                              onPressed: () async {
                                await _trySubmitForm();
                              },
                              text: 'Continue',
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 8.sp),
                            Text(
                              'Or',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.sp),
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
      ),
    );
  }
}
