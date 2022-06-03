import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class ProductDetailCard extends StatelessWidget {
  final ProductModel productModel;
  ProductDetailCard({required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.sp),
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.sp),
            image: DecorationImage(
              image: AssetImage(backgroundProduct),
              fit: BoxFit.fill,
            ),
          ),
        ),
        // Positioned(
        //   bottom: 10,
        //   right: 25.w,
        //   child: CustomNetworkImage(
        //     urlToImage: productModel.urlToImage,
        //     height: 45.w,
        //     width: 45.w,
        //     fit: BoxFit.cover,
        //     shape: BoxShape.rectangle,
        //   ),
        // ),
        Positioned(
          right: 16.sp,
          child: Container(
            height: 70.sp,
            width: 100.sp,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.sp),
            ),
            child: Center(
              child: Container(
                height: 60.sp,
                width: 90.sp,
                decoration: BoxDecoration(
                  color: colorPrimary,
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            PhosphorIcons.star_fill,
                            size: 12.sp,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 5.sp),
                          Text(
                            '2.5',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.25.sp),
                      Text(
                        '250 reviews',
                        style: TextStyle(
                          fontSize: 11.5.sp,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 25.sp,
          top: 15.sp,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   width: 50.w,
                //   child: Text(
                //     productModel.title,
                //     style: TextStyle(
                //       height: 1.25.sp,
                //       fontSize: 13.sp,
                //       color: Colors.white,
                //       fontWeight: FontWeight.w700,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 1.25.sp,
                // ),
                // Text(
                //   productModel.type,
                //   style: TextStyle(
                //     fontSize: 13.sp,
                //     color: Colors.white,
                //   ),
                // )
              ],
            ),
          ),
        )
      ],
    );
  }
}
