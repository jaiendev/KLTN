import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';
import 'package:app_kltn_trunghoan/models/cart_model.dart';
import 'package:flutter/material.dart';

class ProductOrderCard extends StatelessWidget {
  final CartModel cartModel;
  ProductOrderCard({required this.cartModel});
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
                  // decoration:
                  //     AppDecoration.buttonActionBorder(context, 4.sp).decoration,
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
                  child: Image.asset(
                    productFake,
                    height: 22.sp,
                    width: 22.sp,
                    fit: BoxFit.cover,
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
                            child: Text(
                              cartModel.productName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: colorPrimary,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            'x${cartModel.qty}',
                            style: TextStyle(
                              color: colorPrimary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.sp),
                      Text(
                        'Giá: ${cartModel.costString}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 11.sp,
                          color: Colors.redAccent,
                        ),
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
