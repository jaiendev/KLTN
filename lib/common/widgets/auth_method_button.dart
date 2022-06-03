import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuthMethodButton extends StatelessWidget {
  final Size imageSize;
  final Function onTap;
  final String image;
  final EdgeInsets padding;
  const AuthMethodButton({
    Key? key,
    required this.imageSize,
    required this.onTap,
    required this.image,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.sp,
      ),
      child: TouchableOpacity(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: colorGray2,
              width: 0.5,
            ),
            color: Colors.black.withOpacity(0.1),
          ),
          padding: padding,
          width: 35.sp,
          height: 35.sp,
          child: Center(
            child: Image.asset(
              image,
              width: imageSize.width,
              height: imageSize.height,
            ),
          ),
        ),
      ),
    );
  }
}
