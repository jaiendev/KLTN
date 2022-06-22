import 'package:app_kltn_trunghoan/common/widgets/custom_image/network_image/cached_image.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/models/category_home_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class CategoryCard extends StatelessWidget {
  final CategoryHomeModel categories;
  const CategoryCard({
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(
          Routes.FILTER_PRODUCT,
          arguments: {
            'categoryHomeModel': categories,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorPrimary.withOpacity(0.74),
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
                    child: CustomNetworkImage(
                      urlToImage: categories.imageCategory,
                      height: 35.sp,
                      width: 35.sp,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.sp),
            Text(
              categories.name,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
