import 'package:app_kltn_trunghoan/common/widgets/shimmers/fade_simmer.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class ProductCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
          decoration: BoxDecoration(
            color: colorWhite1,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Column(
            children: [
              Container(
                height: 100.sp,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 8.sp, horizontal: 7.sp),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.sp),
                      ),
                      child: Center(
                        child: FadeShimmer(
                          height: 64.sp,
                          width: 50.sp,
                          fadeTheme: FadeTheme.lightReverse,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(3.sp),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: colorBlack1.withOpacity(.1),
                              offset: Offset(0, -1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Icon(
                          PhosphorIcons.heart_fill,
                          color: Colors.red,
                          size: 11.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.sp),
              FadeShimmer(
                height: 13.sp,
                width: 50.sp,
                fadeTheme: FadeTheme.lightReverse,
              ),
              SizedBox(height: 2.sp),
              FadeShimmer(
                height: 13.sp,
                width: 70.sp,
                fadeTheme: FadeTheme.lightReverse,
              ),
              SizedBox(height: 5.sp),
              FadeShimmer(
                height: 13.sp,
                width: 40.sp,
                fadeTheme: FadeTheme.lightReverse,
              ),
              FadeShimmer(
                height: 13.sp,
                width: 60.sp,
                fadeTheme: FadeTheme.lightReverse,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(3.sp),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorPrimary,
              boxShadow: [
                BoxShadow(
                  color: colorBlack1.withOpacity(.1),
                  offset: Offset(0, -1),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Icon(
              PhosphorIcons.plus_light,
              color: Colors.white,
              size: 13.sp,
            ),
          ),
        )
      ],
    );
  }
}
