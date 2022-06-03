import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class TextTotal extends StatelessWidget {
  final String title;
  final double price;
  final bool isCheckLast;
  String? description;
  TextTotal({
    required this.title,
    required this.price,
    this.isCheckLast = false,
    this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        children: [
          SizedBox(height: 15.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${title}',
                style: TextStyle(
                  color: colorPrimary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    description != null
                        ? TextSpan(
                            text: '(4 items)  ',
                            style: TextStyle(
                              color: colorPrimary,
                              fontSize: 12.sp,
                            ),
                          )
                        : TextSpan(
                            text: '',
                            style: TextStyle(
                              color: colorPrimary,
                              fontSize: 12.sp,
                            ),
                          ),
                    TextSpan(
                      text: '\$',
                      style: TextStyle(
                        color: colorPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: '${price}',
                      style: TextStyle(
                        color: colorPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: ' USB',
                      style: TextStyle(
                        color: colorGray2,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.sp),
          !isCheckLast ? dividerChat : SizedBox(),
        ],
      ),
    );
  }
}
