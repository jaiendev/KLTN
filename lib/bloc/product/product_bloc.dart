import 'package:app_kltn_trunghoan/data/remote_data_source/product_responsitory.dart';
import 'package:app_kltn_trunghoan/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial());

  Map<String, List<ProductModel>> productHomes = {};
  bool isAscending = false;

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

    if (event is AscendingEvent) {
      isAscending = event.isAscending;
      if (!isAscending) {
        if (productHomes[event.idCategory] != null) {
          productHomes[event.idCategory]!
              .sort((a, b) => a.price.compareTo(b.price));
        }
      } else {
        if (productHomes[event.idCategory] != null) {
          productHomes[event.idCategory]!
              .sort((b, a) => a.price.compareTo(b.price));
        }
      }
      yield _getDoneProductCategoryHome;
    }
  }

  //private
  // GettingProductCategoryHome get _gettingProductCategoryHome =>
  //     GettingProductCategoryHome(
  //         products: productHomes, productBanner: productBanner);
  GetDoneProductCategoryHome get _getDoneProductCategoryHome =>
      GetDoneProductCategoryHome(products: productHomes);

  Future<void> _getProductHome(OnProductCategoryHomeEvent event) async {
    List<ProductModel>? _products = await ProductResponsitory()
        .getProductCategoryChild(idCategory: event.idCategory);

    if (_products != null && _products.isNotEmpty) {
      productHomes[event.idCategory] = _products;
      if (!isAscending) {
        productHomes[event.idCategory]!
            .sort((a, b) => a.price.compareTo(b.price));
      } else {
        productHomes[event.idCategory]!
            .sort((b, a) => a.price.compareTo(b.price));
      }
    }
  }
}
