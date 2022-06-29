part of 'purchases_bloc.dart';

@immutable
abstract class PurchasesEvent {}

class GetPurchasesStatusEvent extends PurchasesEvent {
  final int status;
  GetPurchasesStatusEvent({required this.status});
}

class AddPurchaseEvent extends PurchasesEvent {
  final PurchaseModel purchaseModel;
  AddPurchaseEvent({required this.purchaseModel});
}

class RefreshPurchaseEvent extends PurchasesEvent {
  final int status;
  RefreshPurchaseEvent({required this.status});
}

class CleanPurchasesEvent extends PurchasesEvent {}
