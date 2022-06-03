import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:app_kltn_trunghoan/ui/started_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'routes/app_navigator_observer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    precacheImage(AssetImage('assets/images/img_begin.png'), context);
    precacheImage(AssetImage('assets/images/img_login.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: AppNavigator.navigatorKey,
            title: 'Store HongJun',
            theme: ThemeData(
              fontFamily: PTSANS,
              primaryColor: colorPrimary,
            ),
            navigatorObservers: [
              AppNavigatorObserver(),
            ],
            onGenerateRoute: (settings) {
              return AppNavigator().getRoute(settings);
            },
            initialRoute: Routes.STARTED,
            home: StartedScreen(),
          );
        },
      ),
    );
  }
}
