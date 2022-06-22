part of 'purchases_bloc.dart';

@immutable
abstract class PurchasesState {
  List get props => [];
}

class PurchasesInitial extends PurchasesState {
  List get props => [];
}

class GetDonePurchase extends PurchasesState {
  final Map<int, List<PurchaseModel>> purchases;
  GetDonePurchase({required this.purchases});

  @override
  List get props => [purchases];
}
