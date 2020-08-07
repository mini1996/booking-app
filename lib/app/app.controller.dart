import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:bookingapp/app/data/sync_helpers/sync_helper.dart';
import 'package:bookingapp/constants/preferences.dart';
import 'package:bookingapp/globals.dart';
import 'package:bookingapp/utils/logger.dart';

class AppController extends ControllerMVC implements AppConMVC {
  final log = getLogger('App Controller');
  factory AppController([StateMVC state]) {
    _this ??= AppController._(state);
    return _this;
  }
  static AppController _this;

  AppController._([StateMVC state]) : super(state);
  static AppController get controller => _this;
  var internetConnectivityListener;

  @override
  Future<bool> init() {
    // TODO: implement init
    return null;
  }

  @override
  void initApp() async {
    await initialiseUser();
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      Globals.isNetworkAvailable = true;
    }

    internetConnectivityListener = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        Globals.isNetworkAvailable = false;
      } else {
        Globals.isNetworkAvailable = true;
      }
    });
  }

  // Timer.periodic(Duration(seconds: 3), (timer) {
  //   refreshGroupsList();
  // });

  initialiseUser() async {
    SharedPreferences mySharedPreferences =
        await SharedPreferences.getInstance();
    String phoneString = mySharedPreferences.getString(Preferences.phone);
    String userIdString = mySharedPreferences.getString(Preferences.userId);
    String userServerIdString =
        mySharedPreferences.getString(Preferences.userServerId);
    int userId = userIdString != null ? int.parse(userIdString) : null;
    int userServerId =
        userServerIdString != null ? int.parse(userServerIdString) : null;
  }

  // changeSynchronisationStatus(SynchronizationStatus status) {
  //   // homeController.setState(() {
  //   //   homeController.appSyncStatus = status;
  //   // });
  // }
}
