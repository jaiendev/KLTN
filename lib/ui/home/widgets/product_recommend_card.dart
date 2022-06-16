import 'package:app_kltn_trunghoan/common/widgets/button_icon.dart';
import 'package:app_kltn_trunghoan/common/widgets/custom_image/network_image/cached_image.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/models/product_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class ProductRecommendCard extends StatelessWidget {
  final ProductModel productModel;
  const ProductRecommendCard({required this.productModel});
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        AppNavigator.push(
          Routes.DETAIL_PRODUCT,
          arguments: {
            'productModel': productModel,
          },
        );
      },
      child: Container(
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
                  // decoration:
                  //     AppDecoration.buttonActionBorder(context, 4.sp).decoration,
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
                  child: CustomNetworkImage(
                    urlToImage: productModel.productPicture ?? '',
                    height: 22.sp,
                    width: 22.sp,
                    fit: BoxFit.cover,
                    shape: BoxShape.rectangle,
                  ),
                ),
                SizedBox(width: 10.sp),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 45.w,
                      child: Text(
                        '${productModel.name}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: colorPrimary,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.sp),
                    Row(
                      children: [
                        Icon(
                          PhosphorIcons.star_fill,
                          size: 11.sp,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 3.sp),
                        Text(
                          '${productModel.ratingAverage}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 11.sp,
                            color: colorPrimary,
                          ),
                        ),
                        SizedBox(width: 20.sp),
                        Text(
                          '${productModel.costString}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 11.sp,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            ButtonIcon(
              icon: Icons.arrow_forward_ios_rounded,
              backgroundColor: colorPrimary,
              colorIcon: colorWhite1,
              onHandlePressed: () {},
              size: 16.sp,
            )
          ],
        ),
      ),
    );
  }
}
