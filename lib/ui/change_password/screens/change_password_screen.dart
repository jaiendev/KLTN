import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/user/user_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/appbars/appbar_title_back.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_primary.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_loading.dart';
import 'package:app_kltn_trunghoan/common/widgets/text_field_form.dart';
import 'package:app_kltn_trunghoan/ui/edit_profile/widgets/title_text_field.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _controllerCurrentPassword = TextEditingController();
  final _controllerNewPassword = TextEditingController();
  final _controllerConfirmPassword = TextEditingController();
  var _passErr = 'Mật khẩu phải có từ 8 kí tự';

  Future<void> _trySubmitForm() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      showDialogLoading();
      AppBloc.userBloc.add(
        ChangePasswordEvent(
          currentPassword: _controllerCurrentPassword.text,
          newPassword: _controllerNewPassword.text,
          confirmPassword: _controllerNewPassword.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarTitleBack(
        context,
        'Đổi mật khẩu',
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(
          left: 16.sp,
          right: 16.sp,
          bottom: 18.sp,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 16.sp),
                  TitleTextField(title: 'Mật khẩu hiện tại'),
                  TextFieldForm(
                    controller: _controllerCurrentPassword,
                    isObscure: true,
                    initialValue: '',
                    validatorForm: (val) {
                      val!.trim().length < 8 ? _passErr : null;
                    },
                  ),
                  TitleTextField(title: 'Mật khẩu mới'),
                  TextFieldForm(
                    controller: _controllerNewPassword,
                    isObscure: true,
                    initialValue: '',
                    validatorForm: (val) {
                      val!.trim().length < 8 ? _passErr : null;
                    },
                  ),
                  TitleTextField(title: 'Nhập lại mật khẩu'),
                  TextFieldForm(
                    controller: _controllerConfirmPassword,
                    isObscure: true,
                    initialValue: '',
                    validatorForm: (val) {
                      if (val!.trim().length < 8)
                        return _passErr;
                      else {
                        if (!val.contains(_controllerNewPassword.text)) {
                          return 'Mật khẩu không giống nhau!!';
                        }
                      }
                    },
                  ),
                ],
              ),
              ButtonPrimary(
                onPressed: () async {
                  _trySubmitForm();
                },
                text: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
