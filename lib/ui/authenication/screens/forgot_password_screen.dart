import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/authenication/authenication_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/appbars/appbar_title_back.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_primary.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_loading.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String _email = '';
  final _formKey = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();

  Future<void> _trySubmitForm() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      showDialogLoading();
      AppBloc.authBloc.add(
        ForgotPasswordEvent(email: _email),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitleBack(
        context,
        'Quên mật khẩu',
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Column(
              children: [
                SizedBox(height: 30.sp),
                Text(
                  'Vui lòng nhập Email bạn đã đăng ký với chúng tôi, chúng tôi sẽ gửi link thiết lập lại mật khẩu cho bạn.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: colorBlack2,
                    height: 1.35.sp,
                  ),
                ),
                SizedBox(height: 18.sp),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _controllerEmail,
                            keyboardType: TextInputType.text,
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.sp),
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  color: colorBlack2, fontSize: 13.sp),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorGray2,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return 'Mời bạn nhập tài khoản quên mật khẩu !!!';
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() {
                                _email = val.trim();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 5.sp,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.sp),
                ButtonPrimary(
                  onPressed: () async {
                    _trySubmitForm();
                  },
                  text: 'Gửi',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
