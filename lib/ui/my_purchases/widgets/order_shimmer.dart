import 'package:app_kltn_trunghoan/common/widgets/shimmers/fade_simmer.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/ui/my_purchases/widgets/product_order_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class OrderCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10.sp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 2.sp, horizontal: 4.sp),
                      decoration: BoxDecoration(
                        color: colorPrimary,
                      ),
                      child: FadeShimmer(
                        height: 12.sp,
                        width: 40.sp,
                        fadeTheme: FadeTheme.lightReverse,
                      ),
                    ),
                    SizedBox(width: 5.sp),
                    FadeShimmer(
                      height: 12.sp,
                      width: 30.w,
                      fadeTheme: FadeTheme.lightReverse,
                    ),
                    Spacer(),
                    FadeShimmer(
                      height: 13.sp,
                      width: 60.sp,
                      fadeTheme: FadeTheme.lightReverse,
                    ),
                  ],
                ),
                SizedBox(height: 8.sp),
                ListView.builder(
                  itemCount: 1,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ProductOrderShimmer();
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 16.sp),
                child: FadeShimmer(
                  height: 13.sp,
                  width: 90.sp,
                  fadeTheme: FadeTheme.lightReverse,
                ),
              ),
            ],
          ),
          dividerChat,
          SizedBox(height: 7.sp),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  PhosphorIcons.truck_light,
                  size: 17.sp,
                  color: Colors.green,
                ),
                SizedBox(width: 5.sp),
                FadeShimmer(
                  height: 10.sp,
                  width: 100.sp,
                  fadeTheme: FadeTheme.lightReverse,
                ),
                Spacer(),
                Icon(
                  PhosphorIcons.caret_right_light,
                  size: 12.sp,
                ),
              ],
            ),
          ),
          SizedBox(height: 7.sp),
          dividerChat,
          SizedBox(height: 7.sp),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeShimmer(
                  height: 9.sp,
                  width: 45.w,
                  fadeTheme: FadeTheme.lightReverse,
                ),
                FadeShimmer(
                  height: 20.sp,
                  width: 70.sp,
                  fadeTheme: FadeTheme.lightReverse,
                ),
              ],
            ),
          ),
          SizedBox(height: 10.sp),
          dividerThinkness6NotMargin,
        ],
      ),
    );
  }
}
