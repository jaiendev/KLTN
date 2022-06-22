import 'dart:io';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class SelectImage extends StatefulWidget {
  final String titleImage;
  final File? imagePicked;
  const SelectImage(
      {Key? key, required this.titleImage, required this.imagePicked})
      : super(key: key);

  @override
  _SelectImageState createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.sp,
      width: 120.sp,
      margin: EdgeInsets.symmetric(vertical: 8.sp),
      child: DottedBorder(
        color: colorHintSearch,
        strokeWidth: 1,
        dashPattern: [8, 4],
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        child: widget.imagePicked != null
            ? Container(
                width: 120.sp,
                height: 80.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                  shape: BoxShape.rectangle,
                  image: widget.imagePicked == null
                      ? null
                      : DecorationImage(
                          image: FileImage(widget.imagePicked!),
                          fit: BoxFit.cover,
                        ),
                ),
              )
            : Container(
                width: 120.sp,
                height: 80.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                  color: colorAddButton,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.sp),
                      child: Image.asset(
                        iconPhoto2,
                        color: colorPrimary,
                        width: 25.sp,
                        height: 25.sp,
                      ),
                    ),
                    Text(
                      widget.titleImage,
                      style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: colorGray1),
                    ),
                    SizedBox(
                      height: 8.sp,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
