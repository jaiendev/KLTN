import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/helpers/extentions/strings_extentions.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

// ignore: must_be_immutable
class TextTotal extends StatefulWidget {
  final String title;
  final int price;
  final bool isCheckLast;
  String? description;
  TextTotal({
    required this.title,
    required this.price,
    this.isCheckLast = false,
    this.description,
  });

  @override
  State<TextTotal> createState() => _TextTotalState();
}

class _TextTotalState extends State<TextTotal> {
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
                '${widget.title}',
                style: TextStyle(
                  color: colorPrimary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    widget.description != null
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
                      text: '${widget.price.toStringAsFixed(0).formatMoney()}',
                      style: TextStyle(
                        color: colorPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: ' VNĐ',
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
          !widget.isCheckLast ? dividerChat : SizedBox(),
        ],
      ),
    );
  }
}
