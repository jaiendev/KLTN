import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/cart/cart_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/custom_image/network_image/cached_image.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/models/cart_model.dart';
import 'package:app_kltn_trunghoan/ui/cart/widgets/button_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class CartCard extends StatefulWidget {
  final CartModel cartModel;
  final Function onTapPlus;
  final Function onTapSub;
  const CartCard({
    required this.cartModel,
    required this.onTapPlus,
    required this.onTapSub,
  });

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(15.sp),
                          child: CustomNetworkImage(
                            urlToImage: widget.cartModel.productPicture,
                            shape: BoxShape.rectangle,
                            height: 38.sp,
                            width: 38.sp,
                          ),
                        ),
                        Visibility(
                          visible: !(widget.cartModel.isWorking ?? true),
                          child: Positioned(
                            child: Container(
                              padding: EdgeInsets.all(3.sp),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(2.sp),
                              ),
                              child: Text(
                                'Ngừng kinh doanh',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 5.sp,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 10.sp),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 50.w,
                          child: Text(
                            widget.cartModel.productName.trim(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: colorPrimary,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.sp),
                        Text(
                          '',
                          style: TextStyle(
                            color: colorGray1,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 3.sp),
                        Text(
                          '${widget.cartModel.costString}',
                          style: TextStyle(
                            color: colorPrimary,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 10.sp,
              bottom: 5.sp,
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ButtonPlus(
                      icon: PhosphorIcons.minus_light,
                      backgroundColor: Colors.white,
                      iconColor: colorPrimary,
                      onTap: widget.onTapSub,
                    ),
                    SizedBox(width: 5.sp),
                    Text(
                      '${widget.cartModel.qty}',
                      style: TextStyle(color: colorPrimary, fontSize: 12.sp),
                    ),
                    SizedBox(width: 5.sp),
                    ButtonPlus(
                      icon: PhosphorIcons.plus_light,
                      onTap: widget.onTapPlus,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10.sp,
              top: 5.sp,
              child: TouchableOpacity(
                onTap: () {
                  AppBloc.cartBloc.add(
                    DeleteProductCartEvent(
                      productId: widget.cartModel.productId,
                    ),
                  );
                },
                child: Container(
                  color: Colors.transparent,
                  child: Icon(
                    PhosphorIcons.x_light,
                    size: 14.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.sp,
        )
      ],
    );
  }
}
