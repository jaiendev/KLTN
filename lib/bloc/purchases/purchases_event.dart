part of 'purchases_bloc.dart';

@immutable
abstract class PurchasesEvent {}

class GetPurchasesStatusEvent extends PurchasesEvent {
  final int status;
  GetPurchasesStatusEvent({required this.status});
}

class CleanPurchasesEvent extends PurchasesEvent {}
