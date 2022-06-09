part of 'timer_bloc.dart';

@immutable
abstract class TimerEvent {}

class StartTimerEvent extends TimerEvent {}

class LoopTimerEvent extends TimerEvent {}

class EndTimerEvent extends TimerEvent {}
