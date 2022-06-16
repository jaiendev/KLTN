part of 'rating_bloc.dart';

@immutable
abstract class RatingEvent {}

class OnRatingProductEvent extends RatingEvent {
  final String productId;
  OnRatingProductEvent({required this.productId});
}

class GetRatingProductEvent extends RatingEvent {
  final String productId;
  GetRatingProductEvent({required this.productId});
}

class AddRatingProductEvent extends RatingEvent {
  final String productId;
  final RatingModel ratingModel;
  AddRatingProductEvent({required this.productId, required this.ratingModel});
}

class UpdateRatingProductEvent extends RatingEvent {
  final String productId;
  final RatingModel ratingModel;
  UpdateRatingProductEvent(
      {required this.productId, required this.ratingModel});
}

class DeleteRatingProductEvent extends RatingEvent {
  final String productId;
  final String ratingId;
  DeleteRatingProductEvent({required this.productId, required this.ratingId});
}

class CleanRatingEvent extends RatingEvent {}
