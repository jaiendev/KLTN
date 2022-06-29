import 'package:app_kltn_trunghoan/common/widgets/shimmers/fade_simmer.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';
import 'package:flutter/material.dart';

class ProductOrderShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.sp),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
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
                SizedBox(width: 8.sp),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60.w,
                            child: FadeShimmer(
                              height: 13.sp,
                              width: 60.sp,
                              fadeTheme: FadeTheme.lightReverse,
                            ),
                          ),
                          Spacer(),
                          FadeShimmer(
                            height: 13.sp,
                            width: 5.sp,
                            fadeTheme: FadeTheme.lightReverse,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.sp),
                      FadeShimmer(
                        height: 12.sp,
                        width: 90.sp,
                        fadeTheme: FadeTheme.lightReverse,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
