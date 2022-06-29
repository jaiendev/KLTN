import 'package:app_kltn_trunghoan/data/remote_data_source/purchase_responsitory.dart';
import 'package:app_kltn_trunghoan/models/purchase_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'purchases_event.dart';
part 'purchases_state.dart';

class PurchasesBloc extends Bloc<PurchasesEvent, PurchasesState> {
  PurchasesBloc() : super(PurchasesInitial());

  final Map<int, List<PurchaseModel>> purchases = {};

  @override
  Stream<PurchasesState> mapEventToState(PurchasesEvent event) async* {
    if (event is GetPurchasesStatusEvent) {
      if (purchases[event.status] == null) {
        yield PurchasesInitial();

        await _getPurchases(event.status);
      }

      yield _getDonePurchases;
    }
    if (event is AddPurchaseEvent) {
      purchases[0]!.insert(0, event.purchaseModel);
      yield _getDonePurchases;
    }
    if (event is RefreshPurchaseEvent) {
      purchases[event.status]!.clear();
      await _getPurchases(event.status);
      yield _getDonePurchases;
    }
  }

  //private

  GetDonePurchase get _getDonePurchases =>
      GetDonePurchase(purchases: purchases);

  Future<void> _getPurchases(int status) async {
    List<PurchaseModel>? _purchases = await PurchaseResponsitory().getPurchases(
      status: status,
    );

    if (_purchases != null) {
      purchases[status] = _purchases;
    }
  }
}
