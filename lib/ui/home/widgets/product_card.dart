import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/models/product_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  const ProductCard({required this.productModel});
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        AppNavigator.push(Routes.DETAIL_PRODUCT, arguments: {
          'productModel': productModel,
        });
      },
      child: Stack(
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
                      // Container(
                      //   padding: EdgeInsets.symmetric(
                      //       vertical: 8.sp, horizontal: 7.sp),
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.circular(6.sp),
                      //   ),
                      //   child: Center(
                      //     child: CustomNetworkImage(
                      //       urlToImage: productModel.urlToImage,
                      //       shape: BoxShape.rectangle,
                      //       height: 64.sp,
                      //       width: 50.sp,
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
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
                // Text(
                //   '${productModel.title}',
                //   overflow: TextOverflow.ellipsis,
                //   textAlign: TextAlign.center,
                //   maxLines: 2,
                //   style: TextStyle(
                //     color: colorPrimary,
                //     fontSize: 12.sp,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
                SizedBox(height: 5.sp),
                // Row(
                //   children: [
                //     Text(
                //       productModel.type,
                //       style: TextStyle(
                //         color: colorGray2,
                //         fontSize: 12.sp,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //     SizedBox(width: 20.sp),
                //     Text(
                //       '\$${productModel.cost}',
                //       style: TextStyle(
                //         color: Colors.amber,
                //         fontSize: 12.sp,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     )
                //   ],
                // )
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
      ),
    );
  }
}
