import 'package:app_kltn_trunghoan/bloc/app_state/bloc.dart';
import 'package:app_kltn_trunghoan/bloc/home/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc {
  static final homeBloc = HomeBloc();
  static final appStateBloc = AppStateBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<HomeBloc>(
      create: (context) => homeBloc,
    ),
    BlocProvider<AppStateBloc>(
      create: (context) => appStateBloc,
    ),
  ];

  static void dispose() {
    appStateBloc.close();
    homeBloc.close();
  }

  static void initialHomeBloc() {
    initialHomeBlocWithAuth();
  }

  // static void initialHomeBlocWithoutAuth() {
  //   hotSearchBloc.add(GetHotSearchEvent());
  //   categoryBloc.add(OnCategoriesEvent());
  //   categoryHomeBloc.add(OnCategoryHomeEvent());
  //   discoverBloc.add(OnDiscoverEvent());
  //   hotExpertHomeBloc.add(GetHotExpertEvent());
  // }

  static void initialHomeBlocWithAuth() {
    // /authBloc.add(RefreshTokenEvent());
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
