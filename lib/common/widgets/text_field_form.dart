import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class TextFieldForm extends StatelessWidget {
  final String? initialValue;
  final String? Function(String?)? validatorForm;
  final void Function(String)? onChanged;
  final bool isAvailable;
  final bool isActive;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String? hintText;
  final bool isObscure;
  final EdgeInsets? margin;
  final String? Function(String?)? submitForm;
  final TextInputAction? textInputAction;
  final double? fontSize;
  final double? height;
  final int? maxLine;
  final double? heightText;
  final Border? border;
  final TextInputType? textInputType;
  final InputBorder? focusedBorder;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final bool readOnly;
  final TextCapitalization? textCapitalization;
  final Color? colorBorder;

  final Color? backgroundColor;
  final Color? colorHintText;
  final Color? colorText;

  TextFieldForm({
    this.initialValue = '',
    required this.validatorForm,
    this.focusedBorder,
    this.contentPadding,
    this.autovalidateMode,
    this.heightText,
    this.maxLine,
    this.height,
    this.fontSize,
    this.submitForm,
    this.textInputAction,
    this.onChanged,
    this.isAvailable = true,
    this.isActive = true,
    this.isObscure = false,
    this.controller,
    this.suffixIcon,
    this.hintText,
    this.margin,
    this.border,
    this.textInputType,
    this.inputFormatters,
    this.focusNode,
    this.onTap,
    this.readOnly = false,
    this.textCapitalization,
    this.colorBorder,
    this.backgroundColor,
    this.colorHintText,
    this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin != null ? margin : EdgeInsets.only(top: 10.sp),
      width: double.infinity,
      height: height ?? null,
      child: TextFormField(
        onTap: onTap,
        focusNode: focusNode,
        onFieldSubmitted: submitForm,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        textInputAction: textInputAction,
        controller: controller ?? TextEditingController(text: initialValue),
        readOnly: readOnly,
        enabled: isAvailable && isActive,
        obscureText: isObscure,
        validator: validatorForm,
        autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
        style: TextStyle(
            fontSize: fontSize != null ? fontSize : 12.sp,
            color: colorText,
            height: heightText != null ? heightText : 1.2),
        cursorColor: colorPrimary,
        keyboardType:
            textInputType != null ? textInputType : TextInputType.multiline,
        maxLines: maxLine != null ? maxLine : 1,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: isAvailable
              ? backgroundColor ?? Colors.white
              : backgroundColor ?? colorInactiveTextField,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.sp),
            borderSide: BorderSide(
              color: colorBorder ?? colorBorderTextField,
              width: 0.5.sp,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.sp),
            borderSide: BorderSide(
              color: colorBorder ?? colorBorderTextField,
              width: 0.5.sp,
            ),
          ),
          hintStyle: TextStyle(
            color: colorHintText ?? colorGray1,
            fontSize: 12.sp,
          ),
          isDense: true,
          focusedBorder: focusedBorder != null
              ? focusedBorder
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.sp),
                  borderSide: BorderSide(
                    color: colorBorderTextField,
                    width: 0.5.sp,
                  ),
                ),
          contentPadding: contentPadding != null
              ? contentPadding
              : EdgeInsets.symmetric(
                  horizontal: 10.sp,
                  vertical: 11.sp,
                ),
          suffix: suffixIcon == null
              ? null
              : Padding(
                  padding: EdgeInsets.only(
                    bottom: 1.25.sp,
                    right: 3.5.sp,
                  ),
                  child: suffixIcon,
                ),
        ),
      ),
    );
  }
}
