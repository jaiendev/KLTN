import 'package:app_kltn_trunghoan/common/widgets/appbars/appbar_title_back.dart';
import 'package:app_kltn_trunghoan/common/widgets/button_primary.dart';
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
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String _oldPassword = '';
  // String _newPassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarTitleBack(
        context,
        'Change Password',
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
                  TitleTextField(title: 'Current Password'),
                  TextFieldForm(
                    isObscure: true,
                    initialValue: '',
                    validatorForm: null,
                  ),
                  TitleTextField(title: 'New Password'),
                  TextFieldForm(
                    isObscure: true,
                    initialValue: '',
                    validatorForm: null,
                  ),
                  TitleTextField(title: 'Confirm Password'),
                  TextFieldForm(
                    isObscure: true,
                    initialValue: '',
                    validatorForm: null,
                  ),
                ],
              ),
              ButtonPrimary(
                onPressed: () async {},
                text: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
