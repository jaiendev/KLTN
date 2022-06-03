import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class PlusMinusWidget extends StatefulWidget {
  PlusMinusWidget({Key? key}) : super(key: key);

  @override
  State<PlusMinusWidget> createState() => _PlusMinusWidgetState();
}

class _PlusMinusWidgetState extends State<PlusMinusWidget> {
  int index = 1;
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
            onTap: () {
              setState(() {
                index++;
              });
            },
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
            '${index}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
            ),
          ),
          SizedBox(width: 10.sp),
          TouchableOpacity(
            onTap: () {
              setState(() {
                if (index > 1) {
                  index--;
                }
              });
            },
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
