import 'package:app_kltn_trunghoan/constants/endpoints.dart';
import 'package:app_kltn_trunghoan/constants/http_status_code.dart';
import 'package:app_kltn_trunghoan/data/base_repository.dart';
import 'package:app_kltn_trunghoan/models/category_home_model.dart';
import 'package:dio/dio.dart';

class CategoryResponsitory {
  Future<List<CategoryHomeModel>?> getCategory() async {
    Response response = await BaseRepository().getRoute(
      Endpoints.CATEGORY,
    );

    if (response.statusCode == StatusCode.CREATED) {
      List listCategory = response.data['categoryList'] ?? [];

      return listCategory
          .map((category) => CategoryHomeModel.fromMap(category))
          .toList();
    }
    return null;
  }
}
