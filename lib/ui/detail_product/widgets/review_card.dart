import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/rating/rating_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/touchable_opacity.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:app_kltn_trunghoan/models/rating_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:app_kltn_trunghoan/ui/detail_product/widgets/review_header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class ReviewCard extends StatelessWidget {
  final RatingModel ratingModel;
  final String productId;
  final bool isCheckLastReview;

  ReviewCard({
    required this.ratingModel,
    required this.productId,
    this.isCheckLastReview = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isCheckLastReview ? 8.sp : 18.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewHeader(
            descriptionBehindStar: DateFormat('dd/MM/yyyy hh:mm')
                .format(ratingModel.createdAt!)
                .toString(),
            urlImage: ratingModel.photo,
            username: ratingModel.name,
            marginStar: EdgeInsets.only(right: 3.sp),
            stars: ratingModel.rating ?? 0,
            sizeStar: 12.sp,
          ),
          SizedBox(height: 2.sp),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 43.sp),
                child: Text(
                  ratingModel.review,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: colorBlack2,
                    height: 1.25.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.sp),
          Visibility(
            visible: ratingModel.user == UserLocal().getUser().id,
            child: Container(
              margin: EdgeInsets.only(left: 43.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TouchableOpacity(
                    onTap: () {
                      AppNavigator.push(Routes.CREATE_RATING, arguments: {
                        'productId': productId,
                        'ratingModel': ratingModel,
                      });
                    },
                    child: Text(
                      'Sửa',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 11.sp,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.sp),
                  TouchableOpacity(
                    onTap: () {
                      AppBloc.ratingBloc.add(
                        DeleteRatingProductEvent(
                          productId: productId,
                          ratingId: ratingModel.id,
                        ),
                      );
                    },
                    child: Text(
                      'Xóa',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 11.sp,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10.sp),
          SizedBox(height: isCheckLastReview ? 0 : 6.sp),
          !isCheckLastReview ? dividerChat : Container(),
        ],
      ),
    );
  }
}
