import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

// ignore: must_be_immutable
class PlusMinusWidget extends StatefulWidget {
  int count;
  final Function onTapAdd;
  final Function onTapSub;
  PlusMinusWidget({
    required this.count,
    required this.onTapAdd,
    required this.onTapSub,
  });
  @override
  State<PlusMinusWidget> createState() => _PlusMinusWidgetState();
}

class _PlusMinusWidgetState extends State<PlusMinusWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorPrimary,
        borderRadius: BorderRadius.circular(6.sp),
      ),
      padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 5.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TouchableOpacity(
            onTap: widget.onTapAdd,
            child: Container(
              padding: EdgeInsets.all(3.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(1.sp),
              ),
              child: Icon(
                PhosphorIcons.plus_light,
                size: 15.sp,
              ),
            ),
          ),
          SizedBox(width: 10.sp),
          Text(
            '${widget.count}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
            ),
          ),
          SizedBox(width: 10.sp),
          TouchableOpacity(
            onTap: widget.onTapSub,
            child: Container(
              padding: EdgeInsets.all(3.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(1.sp),
              ),
              child: Icon(
                PhosphorIcons.minus_light,
                size: 15.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
