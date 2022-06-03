import 'dart:io';

import 'package:app_kltn_trunghoan/common/widgets/appbars/appbar_title_back.dart';
import 'package:app_kltn_trunghoan/common/widgets/custom_image/custom_image_picker.dart';
import 'package:app_kltn_trunghoan/common/widgets/custom_image/network_image/cached_image.dart';
import 'package:app_kltn_trunghoan/common/widgets/text_field_form.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/ui/edit_profile/widgets/title_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _locationController = TextEditingController();
  String? _textFullname;
  File? _imagePicked;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarTitleBack(
        context,
        'Edit Profile',
        brightness: Brightness.light,
        backgroundColor: colorPrimary,
        actions: [
          TouchableOpacity(
            onTap: () async {
              // await _trySubmitForm();
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              padding: EdgeInsets.only(
                right: 10.sp,
                // top: 12.sp,
              ),
              child: Text(
                'Update',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            CustomPaint(
                              child: Container(
                                width: 100.w,
                                height: 23.h,
                              ),
                              painter: HeaderCurvedContainer(),
                            ),
                            Positioned(
                              bottom: -15.sp,
                              right: 34.w,
                              child: TouchableOpacity(
                                onTap: () {
                                  CustomImagePicker().openImagePicker(
                                    context: context,
                                    handleFinish: _handlePickImage,
                                  );
                                },
                                child: Stack(
                                  children: [
                                    // _imagePicked == null
                                    //     ? CustomNetworkImage(
                                    //         width: 84.sp,
                                    //         height: 84.sp,
                                    //         margin: EdgeInsets.symmetric(
                                    //           vertical: 16.sp,
                                    //         ),
                                    //         urlToImage: urlImageMan,
                                    //       )
                                    //     : Container(
                                    //         width: 84.sp,
                                    //         height: 84.sp,
                                    //         margin: EdgeInsets.symmetric(
                                    //           vertical: 16.sp,
                                    //         ),
                                    //         decoration: BoxDecoration(
                                    //           shape: BoxShape.circle,
                                    //           image: DecorationImage(
                                    //             image: getImage(),
                                    //             fit: BoxFit.cover,
                                    //           ),
                                    //         ),
                                    //       ),

                                    CustomNetworkImage(
                                      width: 84.sp,
                                      height: 84.sp,
                                      margin: EdgeInsets.symmetric(
                                        vertical: 16.sp,
                                      ),
                                      urlToImage: urlImageMan,
                                    ),
                                    Positioned(
                                      bottom: 24.sp,
                                      right: 4.sp,
                                      child: TouchableOpacity(
                                        onTap: () {
                                          // CustomImagePicker().openImagePicker(
                                          //   context: context,
                                          //   handleFinish: _handlePickImage,
                                          // );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(3.sp),
                                          decoration: BoxDecoration(
                                            color: colorPrimary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            PhosphorIcons.pencil_simple_light,
                                            size: 10.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: Column(
                            children: [
                              TitleTextField(
                                title: 'Name',
                                padding: EdgeInsets.zero,
                              ),
                              TextFieldForm(
                                initialValue: 'Edward Larry',
                                validatorForm: null,
                                onChanged: (val) =>
                                    _textFullname = val.toString().trim(),
                              ),
                              TitleTextField(title: 'Address'),
                              TextFieldForm(
                                onTap: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) {
                                      // return BottomSheetProvince(
                                      //   province: _locationController.text,
                                      //   handPressed: (value) {
                                      //     setState(() {
                                      //       _textProvince = ProvinceHelper()
                                      //           .getCodeByProvince(value!)!;
                                      //       _locationController.text =
                                      //           ProvinceHelper().getProvinceByCode(
                                      //               _textProvince!)!;
                                      //     });
                                      //   },
                                      // );
                                      return Container();
                                    },
                                  );
                                },
                                readOnly: true,
                                initialValue: '',
                                controller: _locationController,
                                suffixIcon: Icon(
                                  PhosphorIcons.caret_down_light,
                                  size: 15.sp,
                                ),
                                validatorForm: null,
                              ),
                              TitleTextField(
                                title: 'Email',
                                option: 'Change Email',
                                handlePressed: () {},
                              ),
                              TextFieldForm(
                                initialValue: 'Email',
                                validatorForm: (val) => null,
                                isAvailable: false,
                              ),
                              TitleTextField(
                                title: 'Phone',
                                option: 'Change Phone',
                                handlePressed: () {},
                              ),
                              TextFieldForm(
                                initialValue: 'Phone',
                                validatorForm: (val) => null,
                                isAvailable: false,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handlePickImage(File image) async {
    setState(() {
      _imagePicked = image;
    });
  }

  ImageProvider getImage() {
    return FileImage(_imagePicked!);
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = colorPrimary;
    Path path = Path()
      ..relativeLineTo(0, 80)
      ..quadraticBezierTo(size.width / 2, 120, size.width, 80)
      ..relativeLineTo(0, -80)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
