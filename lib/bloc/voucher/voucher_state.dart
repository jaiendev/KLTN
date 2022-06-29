part of 'voucher_bloc.dart';

@immutable
abstract class VoucherState {
  List get props => [[]];
}

class VoucherInitial extends VoucherState {
  List get props => [[]];
}

class GetDoneVoucher extends VoucherState {
  final List<VoucherModel> vouchers;
  GetDoneVoucher({required this.vouchers});

  @override
  List get props => [vouchers];
}
