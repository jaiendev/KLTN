import 'package:app_kltn_trunghoan/constants/endpoints.dart';
import 'package:app_kltn_trunghoan/constants/http_status_code.dart';
import 'package:app_kltn_trunghoan/data/base_repository.dart';
import 'package:app_kltn_trunghoan/models/rating_model.dart';
import 'package:dio/dio.dart';

class RatingRepository {
  Future<List<RatingModel>?> getRatingProduct({
    required String productId,
  }) async {
    Response response = await BaseRepository().getRoute(
      Endpoints.RATING_PRODUCT + '/' + '${productId}',
    );

    if (response.statusCode == StatusCode.OK) {
      List listProduct = response.data['product']['reviews'] ?? [];

      return listProduct
          .map((product) => RatingModel.fromMap(product))
          .toList();
    }
    return null;
  }

  Future<bool> addRatingProduct({
    required String productId,
    required RatingModel ratingModel,
  }) async {
    var body = {
      'name': ratingModel.name,
      'photo': ratingModel.photo,
      'review': ratingModel.review,
      'rating': ratingModel.rating,
      'photoReviews': [],
    };

    Response response = await BaseRepository()
        .postRoute(Endpoints.ADD_RATING + '/' + '${productId}/reviews', body);
    if ([StatusCode.OK, StatusCode.CREATED].contains(response.statusCode)) {
      return true;
    }
    return false;
  }

  Future<bool> updateRatingProduct({
    required String ratingId,
    required RatingModel ratingModel,
  }) async {
    var body = {
      'review': ratingModel.review,
      'rating': ratingModel.rating,
      'photoReviews': ratingModel.photoReviews,
    };

    Response response = await BaseRepository()
        .patchRoute(Endpoints.UPDATE_RATING + '/' + '${ratingId}', body: body);

    if ([StatusCode.OK, StatusCode.CREATED].contains(response.statusCode)) {
      return true;
    }
    return false;
  }

  Future<bool> deleteRatingProduct({
    required String ratingId,
  }) async {
    Response response = await BaseRepository()
        .deleteRoute(Endpoints.UPDATE_RATING + '/' + '${ratingId}');

    if (response.statusCode == StatusCode.NO_CONTENT) {
      return true;
    }
    return false;
  }
}
