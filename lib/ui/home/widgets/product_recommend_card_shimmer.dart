import 'package:app_kltn_trunghoan/common/widgets/shimmers/fade_simmer.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';

import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class ProductRecommendCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.sp),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.075),
            offset: Offset(-1, -1),
            blurRadius: 1,
          ),
          BoxShadow(
            color: Colors.grey,
            offset: Offset(5, 5),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
      margin:
          EdgeInsets.only(right: 10.sp, top: 5.sp, bottom: 5.sp, left: 0.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.sp),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.075),
                      offset: Offset(-1, -1),
                      blurRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(3, 3),
                      blurRadius: 2,
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10.sp),
                child: FadeShimmer(
                  height: 22.sp,
                  width: 22.sp,
                  fadeTheme: FadeTheme.lightReverse,
                ),
              ),
              SizedBox(width: 10.sp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeShimmer(
                    height: 14.sp,
                    width: 45.w,
                    fadeTheme: FadeTheme.lightReverse,
                  ),
                  SizedBox(height: 5.sp),
                  Row(
                    children: [
                      FadeShimmer(
                        height: 11.sp,
                        width: 11.w,
                        fadeTheme: FadeTheme.lightReverse,
                      ),
                      SizedBox(width: 3.sp),
                      FadeShimmer(
                        height: 12.sp,
                        width: 20.sp,
                        fadeTheme: FadeTheme.lightReverse,
                      ),
                      SizedBox(width: 20.sp),
                      FadeShimmer(
                        height: 12.sp,
                        width: 50.sp,
                        fadeTheme: FadeTheme.lightReverse,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: colorWhite1,
            ),
            child: FadeShimmer(
              height: 16.sp,
              width: 16.sp,
              fadeTheme: FadeTheme.lightReverse,
            ),
          ),
        ],
      ),
    );
  }
}
