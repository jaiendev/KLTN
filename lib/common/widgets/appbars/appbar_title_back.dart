import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

AppBar appBarTitleBack(context, String title,
    {List<Widget>? actions,
    Function? onBackPressed,
    Color? backgroundColor,
    Brightness? brightness,
    double? paddingLeft,
    Color? colorChild,
    PreferredSizeWidget? bottom,
    Widget? titleWidget,
    Widget? leading,
    double? elevation}) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: brightness ?? Brightness.dark,
      statusBarIconBrightness: brightness ?? Brightness.dark,
    ),
    elevation: elevation ?? 0.0,
    backgroundColor: backgroundColor ?? Colors.transparent,
    automaticallyImplyLeading: false,
    centerTitle: true,
    leadingWidth: 40.sp,
    title: titleWidget ??
        Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
            color: backgroundColor != null ? Colors.white : colorPrimary,
          ),
        ),
    leading: TouchableOpacity(
      onTap: () {
        if (onBackPressed != null) {
          onBackPressed();
        } else {
          AppNavigator.pop();
        }
      },
      child: Container(
        color: Colors.transparent,
        child: leading ??
            Icon(
              PhosphorIcons.caret_left_light,
              size: 20.sp,
              color: backgroundColor != null ? Colors.white : colorPrimary,
            ),
      ),
    ),
    actions: actions,
    bottom: bottom,
  );
}
