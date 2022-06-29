// ignore_for_file: prefer_const_constructors

import 'package:app_kltn_trunghoan/home.dart';
import 'package:app_kltn_trunghoan/routes/app_navigator_observer.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:app_kltn_trunghoan/routes/scaffold_wrapper.dart';
import 'package:app_kltn_trunghoan/routes/transition_routes.dart';
import 'package:app_kltn_trunghoan/ui/authenication/screens/forgot_password_screen.dart';
import 'package:app_kltn_trunghoan/ui/authenication/screens/login_screen.dart';
import 'package:app_kltn_trunghoan/ui/authenication/screens/register_screen.dart';
import 'package:app_kltn_trunghoan/ui/cart/screens/cart_screen.dart';
import 'package:app_kltn_trunghoan/ui/change_password/screens/change_password_screen.dart';
import 'package:app_kltn_trunghoan/ui/detail_product/screens/create_rating_screen.dart';
import 'package:app_kltn_trunghoan/ui/detail_product/screens/detail_product_screen.dart';
import 'package:app_kltn_trunghoan/ui/edit_profile/screens/edit_photo_screen.dart';
import 'package:app_kltn_trunghoan/ui/edit_profile/screens/edit_profile_screen.dart';
import 'package:app_kltn_trunghoan/ui/favorite_product/screens/favorite_product_screen.dart';
import 'package:app_kltn_trunghoan/ui/filter_product/screens/filter_product_screen.dart';
import 'package:app_kltn_trunghoan/ui/my_purchases/screens/my_purchases_screen.dart';
import 'package:app_kltn_trunghoan/ui/payment/screens/payment_result.dart';
import 'package:app_kltn_trunghoan/ui/payment/screens/web_view_vnpay.dart';
import 'package:app_kltn_trunghoan/ui/started_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator extends RouteObserver<PageRoute<dynamic>> {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  Route getRoute(RouteSettings settings) {
    Map<String, dynamic>? arguments = _getArguments(settings);

    switch (settings.name) {
      case Routes.HOME:
        return _buildRoute(
          settings,
          Home(),
        );
      case Routes.STARTED:
        return _buildRoute(
          settings,
          StartedScreen(),
        );

      case Routes.LOGIN:
        return _buildRoute(
          settings,
          LoginScreen(),
        );

      case Routes.REGISTER:
        return _buildRoute(
          settings,
          RegisterScreen(),
        );

      //Product
      case Routes.DETAIL_PRODUCT:
        return _buildRoute(
          settings,
          DetailProductScreen(
            productModel: arguments?['productModel'],
          ),
        );
      case Routes.CART:
        return _buildRoute(
          settings,
          CartScreen(),
        );
      case Routes.FILTER_PRODUCT:
        return _buildRoute(
          settings,
          FilterProductScreen(
            categoryHomeModel: arguments?['categoryHomeModel'],
          ),
        );
      case Routes.EDIT_PROFILE:
        return _buildRoute(
          settings,
          EditProfileScreen(),
        );
      case Routes.CHANGE_PASSWORD:
        return _buildRoute(
          settings,
          ChangePasswordScreen(),
        );
      case Routes.FAVORITE_PRODUCT:
        return _buildRoute(
          settings,
          FavoriteProductScreen(),
        );
      case Routes.MY_PURCHASES:
        return _buildRoute(
          settings,
          MyPurchasesScreen(
            indexCurrent: arguments?['indexCurrent'],
          ),
        );

      case Routes.CREATE_RATING:
        return _buildRoute(
          settings,
          CreateRatingScreen(
            productId: arguments?['productId'],
            ratingModel: arguments?['ratingModel'],
          ),
        );

      case Routes.PAYMENT_VNPAY:
        return _buildRoute(
          settings,
          WebViewVNPayScreen(
            url: arguments?['url'],
            onPaymentDone: arguments?['onPaymentDone'],
          ),
        );
      case Routes.PAYMENT_RESULT:
        return _buildRoute(
          settings,
          PaymentResultScreen(
            isSuccess: arguments?['isSuccess'],
            isCheckChatScreen: arguments?['isCheckChatScreen'] ?? false,
          ),
        );
      case Routes.FORGOT_PASSWORD:
        return _buildRoute(
          settings,
          ForgotPasswordScreen(),
        );
      case Routes.EDIT_PHOTO:
        return _buildRoute(
          settings,
          EditPhotoScreen(
            image: arguments!['image'],
            handleFinish: arguments['handleFinish'],
          ),
        );
      default:
        return _buildRoute(
          settings,
          Home(),
        );
    }
  }

  _buildRoute(
    RouteSettings routeSettings,
    Widget builder,
  ) {
    return AppMaterialPageRoute(
      builder: (context) => ScaffoldWrapper(child: builder),
      settings: routeSettings,
    );
  }

  _getArguments(RouteSettings settings) {
    return settings.arguments;
  }

  static Future push<T>(
    String route, {
    Object? arguments,
  }) {
    return state.pushNamed(route, arguments: arguments);
  }

  static Future pushNamedAndRemoveUntil<T>(
    String route, {
    Object? arguments,
  }) {
    return state.pushNamedAndRemoveUntil(
      route,
      (route) => false,
      arguments: arguments,
    );
  }

  static Future replaceWith<T>(
    String route, {
    Map<String, dynamic>? arguments,
  }) {
    return state.pushReplacementNamed(route, arguments: arguments);
  }

  static void popUntil<T>(String route) {
    state.popUntil(ModalRoute.withName(route));
  }

  static void pop() {
    if (canPop) {
      state.pop();
    }
  }

  static bool get canPop => state.canPop();

  static String? currentRoute() => AppNavigatorObserver.currentRouteName;

  static BuildContext? get context => navigatorKey.currentContext;

  static NavigatorState get state => navigatorKey.currentState!;
}
