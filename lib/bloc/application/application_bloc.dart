import 'dart:async';

// import 'package:askany/src/bloc/app_bloc.dart';
// import 'package:askany/src/bloc/authentication/bloc.dart';
// import 'package:askany/src/bloc/bloc.dart';
// import 'package:askany/src/configs/application.dart';
import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/app_state/app_state_event.dart';
import 'package:app_kltn_trunghoan/bloc/application/bloc.dart';
import 'package:app_kltn_trunghoan/bloc/authenication/authenication_bloc.dart';
import 'package:app_kltn_trunghoan/configs/application.dart';
import 'package:bloc/bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(InitialApplicationState());

  @override
  Stream<ApplicationState> mapEventToState(event) async* {
    if (event is OnSetupApplication) {
      await Application().initialAppLication(event.context);

      // Check Logined
      AppBloc.authBloc.add(OnAuthCheck());

      // Initial Network Status
      AppBloc.appStateBloc.add(OnStartApp(isFirstRun: true));

      yield ApplicationCompleted();
    }
  }
}
