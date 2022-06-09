part of 'timer_bloc.dart';

@immutable
abstract class TimerState {}

class TimerInitial extends TimerState {}

class TimerRunInProgress extends TimerState {
  final int duration;

  TimerRunInProgress({required this.duration});
}
