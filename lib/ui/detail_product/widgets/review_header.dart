import 'package:app_kltn_trunghoan/common/widgets/custom_image/network_image/cached_image.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/ui/detail_product/widgets/rating_text_review.dart';
import 'package:flutter/material.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class ReviewHeader extends StatelessWidget {
  final String? urlImage;
  final String username;
  final int? ratingCount;
  final int sizeUrlImage;
  final double? sizeStar;
  final Color colorUsername;
  final EdgeInsetsGeometry? marginStar;
  final double distanceTextAndStar;
  final int stars;
  final String? descriptionBehindStar;
  const ReviewHeader({
    this.urlImage,
    required this.username,
    this.ratingCount,
    this.sizeUrlImage = 35,
    this.sizeStar,
    this.colorUsername = colorBlack2,
    this.marginStar,
    this.distanceTextAndStar = 0,
    required this.stars,
    this.descriptionBehindStar,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
            fit: BoxFit.cover,
            urlToImage: urlImage ?? '',
            width: sizeUrlImage.sp,
            height: sizeUrlImage.sp,
          ),
          SizedBox(width: 6.5.sp),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 1.sp),
                    child: Text(
                      username,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: colorUsername,
                      ),
                    ),
                  ),
                  RatingAndTextReview(
                    stars: stars,
                    ratingCount: ratingCount ?? 0,
                    descriptionBehindStar: descriptionBehindStar,
                    sizeStar: sizeStar,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
