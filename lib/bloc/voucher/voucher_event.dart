part of 'voucher_bloc.dart';

@immutable
abstract class VoucherEvent {}

class GetVoucherEvent extends VoucherEvent {}

class CleanVoucherEvnet extends VoucherEvent {}
