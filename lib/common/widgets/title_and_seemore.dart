import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class TitleAndSeeMore extends StatelessWidget {
  final String title;
  final bool checkSeeMore;
  final Function? handlePressed;
  const TitleAndSeeMore({
    required this.title,
    this.checkSeeMore = true,
    this.handlePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: colorBlack1,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Visibility(
            visible: checkSeeMore,
            child: TouchableOpacity(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'View All',
                    style: TextStyle(
                      color: colorHintSearch,
                      fontSize: 11.sp,
                    ),
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                  Container(
                    padding: EdgeInsets.all(2.sp),
                    decoration: BoxDecoration(
                      color: colorHintSearch,
                      borderRadius: BorderRadius.circular(4.sp),
                    ),
                    child: Icon(
                      PhosphorIcons.caret_right_light,
                      color: Colors.white,
                      size: 8.sp,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
