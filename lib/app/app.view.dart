import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:bookingapp/app/app.controller.dart';
import 'package:bookingapp/app/screens/splash/splash.view.dart';
import 'package:bookingapp/constants/app_theme.dart';
import 'package:bookingapp/globals.dart';
import 'package:bookingapp/router.dart';
import 'package:bookingapp/utils/logger.dart';

class App extends AppMVC {
  final Router _router = Router();
  App({Key key}) : super(con: AppController(), key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BOOKING APP',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: SplashScreen(),
        navigatorKey: Globals().navigatorKey,
        onGenerateRoute: _router.getRoute,
        navigatorObservers: [_router.routeObserver]);
  }
}
