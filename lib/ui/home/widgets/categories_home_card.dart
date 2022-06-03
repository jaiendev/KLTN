import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoriesHomeCard extends StatefulWidget {
  final bool isCheck;
  final IconData icon;
  final String title;
  final Function onHandlePressed;

  const CategoriesHomeCard({
    required this.icon,
    required this.title,
    this.isCheck = false,
    required this.onHandlePressed,
  });
  @override
  State<CategoriesHomeCard> createState() => _CategoriesHomeCardState();
}

class _CategoriesHomeCardState extends State<CategoriesHomeCard> {
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: widget.onHandlePressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
        margin: EdgeInsets.only(right: 10.sp),
        decoration: BoxDecoration(
          border: Border.all(width: 1.sp, color: Color(0xFFE3E3E3)),
          color: !widget.isCheck ? colorWhite1 : colorPrimary,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Row(
          children: [
            Visibility(
              visible: widget.isCheck,
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      widget.icon,
                      size: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5.sp),
                ],
              ),
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: !widget.isCheck ? colorPrimary : Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
