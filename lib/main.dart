import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bookingapp/app/app.view.dart';

//if we need to add crashlytics, uncomment below line
// import 'package:flutter_crashlytics/flutter_crashlytics.dart';

// void main() async {
//   // runApp(App());
//   WidgetsFlutterBinding.ensureInitialized();
//   bool isInDebugMode = true;

//   FlutterError.onError = (FlutterErrorDetails details) {
//     print("from crashlytics main.dart ${details}");
//     if (isInDebugMode) {
//       // In development mode simply print to console.
//       FlutterError.dumpErrorToConsole(details);
//     } else {
//       // In production mode report to the application zone to report to
//       // Crashlytics.
//       Zone.current.handleUncaughtError(details.exception, details.stack);
//     }
//   };

//   await FlutterCrashlytics().initialize();

//   runZoned<Future<Null>>(() async {
//     print("main file");
//     runApp(App());
//   }, onError: (error, stackTrace) async {
//     // Whenever an error occurs, call the `reportCrash` function. This will send
//     // Dart errors to our dev console or Crashlytics depending on the environment.
//     await FlutterCrashlytics()
//         .reportCrash(error, stackTrace, forceCrash: false);
//   });

// // BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}
