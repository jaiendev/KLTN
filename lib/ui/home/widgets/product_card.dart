import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/cart/cart_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/rating/rating_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/custom_image/network_image/cached_image.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_confirm_cancel.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_wrapper.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:app_kltn_trunghoan/models/product_model.dart';
import 'package:app_kltn_trunghoan/models/slide_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  const ProductCard({required this.productModel});
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        AppBloc.ratingBloc
            .add(OnRatingProductEvent(productId: productModel.id));
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
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.sp, horizontal: 7.sp),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.sp),
                        ),
                        child: Center(
                          child: CustomNetworkImage(
                            urlToImage: productModel.productPicture,
                            shape: BoxShape.rectangle,
                            height: 64.sp,
                            width: 50.sp,
                            fit: BoxFit.cover,
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
                Text(
                  '${productModel.name}',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    color: colorPrimary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5.sp),
                Text(
                  '${productModel.categoryName}',
                  style: TextStyle(
                    color: colorGray2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${productModel.costString}',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: TouchableOpacity(
              onTap: () async {
                if (UserLocal().getAccessToken() != '') {
                  await dialogAnimationWrapper(
                    borderRadius: 10.sp,
                    slideFrom: SlideMode.bot,
                    child: DialogConfirmCancel(
                      title: 'Thêm sản phẩm vào giỏ hàng',
                      bodyBefore: 'Sản phẩm này sẽ được thêm vào giỏ hàng?',
                      confirmText: 'Đồng ý',
                      cancelText: 'Hủy',
                      onConfirmed: () async {
                        AppBloc.cartBloc.add(
                          AddProductCartEvent(
                            productId: productModel.id,
                            qty: 1,
                            price: productModel.price.round(),
                            productName: productModel.name,
                            productImage: productModel.productPicture ?? '',
                          ),
                        );
                        AppNavigator.pop();
                      },
                    ),
                  );
                } else {
                  AppNavigator.push(Routes.STARTED);
                }
              },
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
                  size: 16.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
