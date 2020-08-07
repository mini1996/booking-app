import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:bookingapp/app/screens/splash/splash.controller.dart';
import 'package:bookingapp/constants/pages.dart';
import 'package:bookingapp/utils/loader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bookingapp/utils/globals.dart' as globals;

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends StateMVC<SplashScreen> {
  _SplashScreenState() : super(Controller());
  Controller _controller;
  @override
  void initState() {
    //runs second
    super.initState();
    _controller = Controller.controller;
    add(_controller.appController); //add the app's controller to this view
    _controller.init(); //use this
  }

  @override
  void dispose() {
    //runs first
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    globals.context = context;
    return new Scaffold(
      body: Center(
        child: Loader.loader(context),
      ),
    );
  }
}
