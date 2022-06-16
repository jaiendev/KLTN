part of 'rating_bloc.dart';

@immutable
abstract class RatingState {
  List get props => [];
}

class RatingInitial extends RatingState {
  List get props => [];
}

class GettingRating extends RatingState {
  final Map<String, List<RatingModel>> ratings;
  GettingRating({required this.ratings});

  @override
  List get props => [ratings];
}

class GetDoneRating extends RatingState {
  final Map<String, List<RatingModel>> ratings;
  GetDoneRating({required this.ratings});
  @override
  List get props => [ratings];
}
