import 'package:app_kltn_trunghoan/bloc/app_state/bloc.dart';
import 'package:app_kltn_trunghoan/bloc/application/application_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/authenication/authenication_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/home/home_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/timer/timer_bloc.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc {
  static final homeBloc = HomeBloc();
  static final appStateBloc = AppStateBloc();
  static final applicationBloc = ApplicationBloc();
  static final authBloc = AuthenicationBloc();
  static final timerBloc = TimerBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<HomeBloc>(
      create: (context) => homeBloc,
    ),
    BlocProvider<AppStateBloc>(
      create: (context) => appStateBloc,
    ),
    BlocProvider<ApplicationBloc>(
      create: (context) => applicationBloc,
    ),
    BlocProvider<AuthenicationBloc>(
      create: (context) => authBloc,
    ),
    BlocProvider<TimerBloc>(
      create: (context) => timerBloc,
    ),
  ];

  static void dispose() {
    appStateBloc.close();
    homeBloc.close();
    applicationBloc.close();
    authBloc.close();
    timerBloc.close();
  }

  static void initialHomeBloc() {
    initialHomeBlocWithoutAuth();
    if (UserLocal().getAccessToken() != '') {
      initialHomeBlocWithAuth();
    }
  }

  static void initialHomeBlocWithoutAuth() {
    // hotSearchBloc.add(GetHotSearchEvent());
    // categoryBloc.add(OnCategoriesEvent());
    // categoryHomeBloc.add(OnCategoryHomeEvent());
    // discoverBloc.add(OnDiscoverEvent());
    // hotExpertHomeBloc.add(GetHotExpertEvent());
  }

  static void initialHomeBlocWithAuth() {
    // userBloc.add(GetUserInfo());
    // badgesBloc.add(GetBadgesChatEvent());
    // chatBloc.add(OnChatEvent());
    // notificationBloc.add(GetNotificationEvent());
    // serviceManagamentBloc.add(GetCancelServiceReasonsEvent());
    // hotSearchBloc.add(GetHotSearchEvent());
    // paymentCard.add(OnPaymentCardEvent());
    // calendarBloc..add(GetCalendarEvent());
  }

  static void cleanBloc() {
    homeBloc.add(OnChangeIndexEvent());
  }

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
