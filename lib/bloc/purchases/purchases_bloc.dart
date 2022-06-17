import 'package:app_kltn_trunghoan/data/remote_data_source/purchase_responsitory.dart';
import 'package:app_kltn_trunghoan/models/purchase_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'purchases_event.dart';
part 'purchases_state.dart';

class PurchasesBloc extends Bloc<PurchasesEvent, PurchasesState> {
  PurchasesBloc() : super(PurchasesInitial());

  final List<PurchaseModel> purchases = [];

  @override
  Stream<PurchasesState> mapEventToState(PurchasesEvent event) async* {
    if (event is GetPurchasesStatusEvent) {
      await _getPurchases(event);
      yield _getDonePurchases;
    }
  }

  //private

  GetDonePurchase get _getDonePurchases =>
      GetDonePurchase(purchases: purchases);

  Future<void> _getPurchases(GetPurchasesStatusEvent event) async {
    List<PurchaseModel>? _purchases = await PurchaseResponsitory().getPurchases(
      status: event.status,
    );

    if (_purchases != null) {
      purchases.clear();
      purchases.addAll(_purchases);
    }
  }
}
