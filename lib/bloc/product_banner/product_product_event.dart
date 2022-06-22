part of 'product_home_bloc.dart';

@immutable
abstract class ProductHomeEvent {}

class GetProductHomeEvent extends ProductHomeEvent {}

class ClearProductHomeEvent extends ProductHomeEvent {}
