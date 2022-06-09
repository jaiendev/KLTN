import 'package:app_kltn_trunghoan/bloc/app_bloc.dart';
import 'package:app_kltn_trunghoan/bloc/app_state/app_state_event.dart';
import 'package:app_kltn_trunghoan/bloc/authenication/authenication_bloc.dart';

import 'package:app_kltn_trunghoan/constants/constants.dart';
import 'package:app_kltn_trunghoan/helpers/device_orientation_helper.dart';
import 'package:app_kltn_trunghoan/home.dart';
import 'package:app_kltn_trunghoan/routes/app_pages.dart';
import 'package:app_kltn_trunghoan/routes/app_routes.dart';
import 'package:app_kltn_trunghoan/routes/scaffold_wrapper.dart';
import 'package:app_kltn_trunghoan/ui/home/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'bloc/application/bloc.dart';
import 'routes/app_navigator_observer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    precacheImage(AssetImage('assets/images/img_begin.png'), context);
    precacheImage(AssetImage('assets/images/img_login.png'), context);
    WidgetsBinding.instance!.addObserver(this);
    DeviceOrientationHelper().setPortrait();
    AppBloc.applicationBloc.add(OnSetupApplication(context));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (AppBloc.timerBloc.duration == 0) {
      switch (state) {
        case AppLifecycleState.resumed:
          AppBloc.appStateBloc.add(OnResume());
          break;
        case AppLifecycleState.paused:
          AppBloc.appStateBloc.add(OnBackground());

          break;
        default:
          break;
      }
    }
  }

  @override
  void dispose() {
    AppBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: BlocBuilder<AuthenicationBloc, AuthenicationState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, auth) {
          return Sizer(
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
                initialRoute: Routes.HOME,
                builder: (context, child) {
                  return MediaQuery(
                    child: child!,
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  );
                },
                home: BlocBuilder<ApplicationBloc, ApplicationState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, application) {
                    if (application is ApplicationCompleted) {
                      return ScaffoldWrapper(
                        child: Home(),
                      );
                    }
                    return ScaffoldWrapper(child: SplashScreen());
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
