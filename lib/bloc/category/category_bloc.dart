import 'package:app_kltn_trunghoan/data/remote_data_source/category_responsitory.dart';
import 'package:app_kltn_trunghoan/models/category_home_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial());

  final List<CategoryHomeModel> categories = [];

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is GetCategoryEvent) {
      if (categories.isEmpty) {
        yield CategoryInitial();

        await _getCategory();
      }
      yield _getDoneCategory;
    }

    if (event is CleanCategoryEvnet) {
      categories.clear();
      yield _getDoneCategory;
    }
  }

  //private
  GetDoneCategory get _getDoneCategory =>
      GetDoneCategory(categories: categories);

  Future<void> _getCategory() async {
    List<CategoryHomeModel>? _categories =
        await CategoryResponsitory().getCategory();

    if (_categories != null) {
      categories.addAll(_categories);
    }
  }
}
