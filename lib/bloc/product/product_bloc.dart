import 'package:app_kltn_trunghoan/data/remote_data_source/product_responsitory.dart';
import 'package:app_kltn_trunghoan/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial());

  Map<String, List<ProductModel>> productHomes = {};
  List<ProductModel> productBanner = [];

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is OnProductCategoryHomeEvent) {
      if (productHomes[event.idCategory] == null) {
        yield ProductInitial();

        await _getProductHome(event);
      }
      yield _getDoneProductCategoryHome;
    }

    if (event is ClearProductCategoryEvent) {
      productHomes.clear();
      yield _getDoneProductCategoryHome;
    }
  }

  //private
  // GettingProductCategoryHome get _gettingProductCategoryHome =>
  //     GettingProductCategoryHome(
  //         products: productHomes, productBanner: productBanner);
  GetDoneProductCategoryHome get _getDoneProductCategoryHome =>
      GetDoneProductCategoryHome(
          products: productHomes, productBanner: productBanner);

  Future<void> _getProductHome(OnProductCategoryHomeEvent event) async {
    List<ProductModel>? _products = await ProductResponsitory()
        .getProductCategoryChild(idCategory: event.idCategory);

    if (_products != null) {
      productBanner.add(_products.first);

      productHomes[event.idCategory] = _products;
    }
  }
}
