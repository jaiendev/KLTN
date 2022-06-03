part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class OnChangeIndexEvent extends HomeEvent {
  final int index;
  OnChangeIndexEvent({this.index = 0});
}

class RefreshHomeEvent extends HomeEvent {
  final Function handleFinished;
  RefreshHomeEvent({required this.handleFinished});
}
