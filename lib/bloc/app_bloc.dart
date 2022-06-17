import 'package:app_kltn_trunghoan/bloc/app_state/bloc.dart';
import 'package:app_kltn_trunghoan/bloc/application/application_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/authenication/authenication_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/cart/cart_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/category/category_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/home/home_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/product/product_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/purchases/purchases_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/rating/rating_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/timer/timer_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/user/user_bloc.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/user_local_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc {
  static final homeBloc = HomeBloc();
  static final appStateBloc = AppStateBloc();
  static final applicationBloc = ApplicationBloc();
  static final authBloc = AuthenicationBloc();
  static final timerBloc = TimerBloc();
  static final productBloc = ProductBloc();
  static final cartBloc = CartBloc();
  static final ratingBloc = RatingBloc();
  static final userBloc = UserBloc();
  static final categoryBloc = CategoryBloc();
  static final purchaseBloc = PurchasesBloc();

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
    BlocProvider<ProductBloc>(
      create: (context) => productBloc,
    ),
    BlocProvider<CartBloc>(
      create: (context) => cartBloc,
    ),
    BlocProvider<RatingBloc>(
      create: (context) => ratingBloc,
    ),
    BlocProvider<UserBloc>(
      create: (context) => userBloc,
    ),
    BlocProvider<CategoryBloc>(
      create: (context) => categoryBloc,
    ),
    BlocProvider<PurchasesBloc>(
      create: (context) => purchaseBloc,
    ),
  ];

  static void dispose() {
    appStateBloc.close();
    homeBloc.close();
    applicationBloc.close();
    authBloc.close();
    timerBloc.close();
    productBloc.close();
    cartBloc.close();
    ratingBloc.close();
    userBloc.close();
    categoryBloc.close();
    purchaseBloc.close();
  }

  static void initialHomeBloc() {
    initialHomeBlocWithoutAuth();
    if (UserLocal().getAccessToken() != '') {
      initialHomeBlocWithAuth();
    }
  }

  static void initialHomeBlocWithoutAuth() {
    productBloc.add(
        OnProductCategoryHomeEvent(idCategory: '61a8a5c663bfc4c3df6b3c3c'));
    categoryBloc.add(GetCategoryEvent());
    // hotSearchBloc.add(GetHotSearchEvent());
    // categoryBloc.add(OnCategoriesEvent());
    // categoryHomeBloc.add(OnCategoryHomeEvent());
    // discoverBloc.add(OnDiscoverEvent());
    // hotExpertHomeBloc.add(GetHotExpertEvent());
  }

  static void initialHomeBlocWithAuth() {
    cartBloc.add(GetCartUserEvent());
    purchaseBloc.add(GetPurchasesStatusEvent(status: 0));
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
    productBloc.add(ClearProductCategoryEvent());
    cartBloc.add(CleanCartUserEvent());
    ratingBloc.add(CleanRatingEvent());
    categoryBloc.add(CleanCategoryEvnet());
    purchaseBloc.add(CleanPurchasesEvent());
  }

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
