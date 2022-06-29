import 'package:app_kltn_trunghoan/data/remote_data_source/voucher_responsitory.dart';
import 'package:app_kltn_trunghoan/models/voucher_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'voucher_event.dart';
part 'voucher_state.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  VoucherBloc() : super(VoucherInitial());
  final List<VoucherModel> vouchers = [];

  @override
  Stream<VoucherState> mapEventToState(VoucherEvent event) async* {
    if (event is GetVoucherEvent) {
      if (vouchers.isEmpty) {
        yield VoucherInitial();

        await _getVoucher();
      }
      yield _getDoneVoucher;
    }

    if (event is CleanVoucherEvnet) {
      vouchers.clear();
      yield _getDoneVoucher;
    }
  }

  //private
  GetDoneVoucher get _getDoneVoucher => GetDoneVoucher(vouchers: vouchers);

  Future<void> _getVoucher() async {
    List<VoucherModel>? _voucher = await VoucherResponsitory().getVoucher();

    if (_voucher != null) {
      vouchers.addAll(_voucher);
    }
  }
}
