import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial());
  int duration = 0;
  bool flagTimer = false;

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is StartTimerEvent) {
      flagTimer = false;
      await _onStart();
      yield _inProgress;
    }

    if (event is LoopTimerEvent) {
      await _onStart();
      yield _inProgress;
    }

    if (event is EndTimerEvent) {
      flagTimer = true;
      duration = 0;
      yield TimerInitial();
    }
  }

  // Private methods
  TimerRunInProgress get _inProgress {
    return TimerRunInProgress(
      duration: duration,
    );
  }

  Future<void> _onStart() async {
    if (!flagTimer) {
      await Future.delayed(Duration(seconds: 1), () {
        duration++;
        add(LoopTimerEvent());
      });
    }
  }
}
