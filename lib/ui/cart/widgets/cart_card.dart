import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/ui/cart/widgets/button_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:sizer/sizer.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

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
                      child: Image.asset(
                        productFake,
                        height: 38.sp,
                        width: 38.sp,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10.sp),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Màn hình Dell U3219Q',
                          style: TextStyle(
                            color: colorPrimary,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 3.sp),
                        Text(
                          'Screen',
                          style: TextStyle(
                            color: colorGray1,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 3.sp),
                        Text(
                          '\$19.98',
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
                    ),
                    SizedBox(width: 5.sp),
                    Text(
                      '1',
                      style: TextStyle(color: colorPrimary, fontSize: 12.sp),
                    ),
                    SizedBox(width: 5.sp),
                    ButtonPlus(
                      icon: PhosphorIcons.plus_light,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10.sp,
              top: 5.sp,
              child: Container(
                color: Colors.transparent,
                child: Icon(
                  PhosphorIcons.x_light,
                  size: 14.sp,
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
