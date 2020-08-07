import 'dart:io';
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bookingapp/constants/settings.dart';
import 'package:bookingapp/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bookingapp/app/app.controller.dart';
import 'package:bookingapp/app/screens/splash/splash.model.dart';
import 'package:bookingapp/constants/pages.dart';
import 'package:bookingapp/constants/preferences.dart';
import 'package:bookingapp/globals.dart';
import 'package:bookingapp/utils/logger.dart';

class Controller extends ControllerMVC {
  final log = getLogger('splash');
  factory Controller() {
    if (_this == null) _this = Controller._();
    return _this;
  }
  static Controller _this;

  Controller._();

  static Controller get controller => _this;
  AppController appController;

  Model model = Model();
  Router _router = Router();

  @override
  void initState() {
    //runs first, avoid using this unless mandatory
    super.initState();
    appController = AppController.controller;
  }

  @override
  void dispose() {
    //runs second
    _this = null;
    super.dispose();
  }

  init() {
    // Future.delayed(const Duration(milliseconds: 500), () {
    //   Globals()
    //       .navigatorKey
    //       .currentState
    //       .pushReplacementNamed(Pages.loginScreen);
    // });
    moveToNextPage();
  }

  Future<bool> _checkAuthentication() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();

    if (prefs.getString("authToken") != null) {
      return true;
    } else {
      return false;
    }
  }

  moveToNextPage() async {
    bool isLoggedIn = await _checkAuthentication();
    if (isLoggedIn) {
      var mySharedPreferences = await SharedPreferences.getInstance();
      bool isDataBaseLoaded =
          mySharedPreferences.getBool('isDatabaseLoadedv1.0');

      if (isDataBaseLoaded != null) {
        //TODO: start sync
      } else {
        //database is not loaded fully, go to fetching screen
// Navigator.pushReplacementNamed(context,'/fetchingScreen');
        _router.navigate(Pages.loginScreen, this.stateMVC.context, {});
      }
    } else {
      Navigator.pushReplacementNamed(this.stateMVC.context, Pages.loginScreen);
    }
  }
}
