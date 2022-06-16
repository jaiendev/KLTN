import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class RatingAndTextReview extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final int stars;
  final int ratingCount;
  final String? descriptionBehindStar;
  final double? sizeStar;
  const RatingAndTextReview({
    this.padding,
    required this.stars,
    required this.ratingCount,
    this.descriptionBehindStar,
    this.sizeStar,
  });

  @override
  Widget build(BuildContext context) {
    return stars != 0
        ? Container(
            height: 25.sp,
            padding: padding,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 2.sp),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 5.sp),
                      child: Image.asset(
                        iconStar,
                        width: sizeStar ?? 13.sp,
                        color: index + 1 <= stars.round()
                            ? colorStar
                            : Colors.grey,
                      ),
                    );
                  },
                ),
                SizedBox(width: 3.sp),
                descriptionBehindStar == null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2.sp),
                            child: Text(
                              '${stars.toStringAsFixed(1)}',
                              style: TextStyle(
                                color: colorBlack1,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 2.sp),
                          Text(
                            '($ratingCount lượt nhận xét)',
                            style: TextStyle(
                              color: colorGray2,
                              fontSize: 12.sp,
                            ),
                          )
                        ],
                      )
                    : Container(
                        padding: EdgeInsets.only(top: 5.sp),
                        child: Text(
                          descriptionBehindStar!,
                          style: TextStyle(
                            color: colorGray2,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
              ],
            ),
          )
        : Container(
            height: 25.sp,
            padding: padding,
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 2.sp),
                Text(
                  'Chưa có nhận xét',
                  style: TextStyle(
                    color: colorBlack2,
                    fontSize: 12.5.sp,
                  ),
                )
              ],
            ),
          );
  }
}
