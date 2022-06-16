import 'package:app_kltn_trunghoan/common/widgets/shimmers/fade_simmer.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class CategoryCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(Routes.FILTER_PRODUCT);
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorPrimary.withOpacity(0.74.sp),
          borderRadius: BorderRadius.all(
            Radius.circular(12.sp),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.4),
              offset: Offset(4, 4),
              blurRadius: 4,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              offset: Offset(-1, -1),
              blurRadius: 20,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 60.sp,
              height: 60.sp,
              child: Stack(
                children: [
                  Container(
                    width: 60.sp,
                    height: 60.sp,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Center(
                    child: FadeShimmer(
                      height: 35.sp,
                      width: 35.sp,
                      fadeTheme: FadeTheme.lightReverse,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.sp),
            FadeShimmer(
              height: 13.sp,
              width: 50.sp,
              fadeTheme: FadeTheme.lightReverse,
            ),
          ],
        ),
      ),
    );
  }
}
