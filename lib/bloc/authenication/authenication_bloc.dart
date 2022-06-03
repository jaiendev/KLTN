import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authenication_event.dart';
part 'authenication_state.dart';

class AuthenicationBloc extends Bloc<AuthenicationEvent, AuthenicationState> {
  AuthenicationBloc() : super(AuthenicationInitial());
  @override
  Stream<AuthenicationState> mapEventToState(AuthenicationEvent event) {
    return super.mapEventToState(event);
  }
}
