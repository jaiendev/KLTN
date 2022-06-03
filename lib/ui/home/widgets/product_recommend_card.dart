import 'package:app_kltn_trunghoan/common/widgets/button_icon.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class ProductRecommendCard extends StatelessWidget {
  const ProductRecommendCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Image.asset(
                  productFake,
                  height: 22.sp,
                  width: 22.sp,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10.sp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Màn hình Dell U3219Q',
                    style: TextStyle(
                      color: colorPrimary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
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
                        '2.5',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 11.sp,
                          color: colorPrimary,
                        ),
                      ),
                      SizedBox(width: 20.sp),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$250/',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                                color: Colors.amber,
                              ),
                            ),
                            TextSpan(
                              text: '350',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                                color: colorHintSearch,
                              ),
                            ),
                          ],
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
    );
  }
}
