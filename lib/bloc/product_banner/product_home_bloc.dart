import 'package:app_kltn_trunghoan/data/remote_data_source/product_responsitory.dart';
import 'package:app_kltn_trunghoan/models/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_product_event.dart';
part 'product_home_state.dart';

class ProductHomeBloc extends Bloc<ProductHomeEvent, ProductHomeState> {
  ProductHomeBloc() : super(ProductBannerDartInitial());
  final List<ProductModel> listProduct = [];
  @override
  Stream<ProductHomeState> mapEventToState(ProductHomeEvent event) async* {
    if (event is GetProductHomeEvent) {
      if (listProduct.isEmpty) {
        yield ProductBannerDartInitial();

        await _getProducHome(event);
      }
      yield _getDoneProductHome;
    }
    if (event is ClearProductHomeEvent) {
      listProduct.clear();
    }
  }

  //private
  GetDoneProductHome get _getDoneProductHome =>
      GetDoneProductHome(productModel: listProduct);

  Future<void> _getProducHome(GetProductHomeEvent event) async {
    List<ProductModel>? _products =
        await ProductResponsitory().getProductHome();

    if (_products != null && _products.isNotEmpty) {
      listProduct.addAll(_products);
    }
  }
}
