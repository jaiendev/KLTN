import 'dart:async';
import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/app_state/bloc.dart';
import 'package:app_kltn_trunghoan/bloc/home/home_bloc.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_confirm_cancel.dart';
import 'package:app_kltn_trunghoan/common/widgets/dialogs/dialog_wrapper.dart';
import 'package:app_kltn_trunghoan/models/slide_model.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:app_kltn_trunghoan/helpers/sizer_custom/sizer.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppStateState> {
  AppStateBloc() : super(AppStateInitial());
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  bool isNetworkConnected = true;
  bool isActive = true;

  @override
  Stream<AppStateState> mapEventToState(AppStateEvent event) async* {
    if (event is OnStartApp) {
      _initConnectivity();
      connectivitySubscription =
          _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    }

    if (event is OnResume) {
      _handleResume();
    }

    if (event is OnBackground) {
      _handleBackground();
    }
  }

  // Private Methods
  void _handleResume() {
    if (!isActive) {
      isActive = true;
    }
  }

  void _handleBackground() {
    if (isActive) {
      isActive = true;
    }
  }

  Future<void> _initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        _handleNetworkConnected();
        break;
      case ConnectivityResult.mobile:
        _handleNetworkConnected();
        break;
      default:
        _handleConnectNetworkFail();
        break;
    }
  }

  void _handleNetworkConnected() {
    if (!isNetworkConnected) {
      // Pop dialog alert no internet connected
      AppNavigator.popUntil(Routes.HOME);
      AppBloc.homeBloc.add(OnChangeIndexEvent());
      AppBloc.initialHomeBloc();
    }
    isNetworkConnected = true;
  }

  void _handleConnectNetworkFail() async {
    if (isNetworkConnected) {
      isNetworkConnected = false;
      // Show dialog alert no internet and reconnect
      await dialogAnimationWrapper(
        dismissible: false,
        borderRadius: 10.sp,
        slideFrom: SlideMode.bot,
        child: DialogConfirmCancel(
          bodyBefore: 'Disconnect Internet',
          confirmText: 'Retry',
          onConfirmed: () {
            AppNavigator.popUntil(Routes.HOME);
            AppBloc.homeBloc.add(OnChangeIndexEvent());
            isNetworkConnected = true;
          },
        ),
      );
    }
  }
}
