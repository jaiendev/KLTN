import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TrademarkCard extends StatefulWidget {
  final bool isCheck;
  final String title;
  final Function onHandlePressed;

  const TrademarkCard({
    required this.title,
    this.isCheck = false,
    required this.onHandlePressed,
  });
  @override
  State<TrademarkCard> createState() => _TrademarkCardState();
}

class _TrademarkCardState extends State<TrademarkCard> {
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
        child: Text(
          widget.title,
          style: TextStyle(
            color: !widget.isCheck ? colorPrimary : Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
