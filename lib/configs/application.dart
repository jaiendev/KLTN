import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/data/local_data_source/base_local_data.dart';
import 'package:flutter/material.dart';

class Application {
  static String baseUrl = 'https://evening-mountain-96387.herokuapp.com/';
  static const String mode = MODE_PRODUCTION;
  static bool isShowingError = false;

  Future<void> initialAppLication(BuildContext context) async {
    try {
      await BaseLocalData.initialBox();

      // Initial language

      // AppBloc.userBloc.add(GetLanguagesEvent());
      // AppBloc.requestBloc.add(GetSpecialtyEvent());
      // AppBloc.skillBloc.add(GetPositionsEvent());
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
