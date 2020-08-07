import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:bookingapp/app/app.controller.dart';
import 'package:bookingapp/app/screens/template/template.model.dart';
import 'package:bookingapp/utils/logger.dart';

class Controller extends ControllerMVC {
  final log = getLogger('template');
  factory Controller() {
    if (_this == null) _this = Controller._();
    return _this;
  }
  static Controller _this;

  Controller._();

  static Controller get controller => _this;
  AppController appController;

  Model model = Model();

  //  get pageStatus => model.pageStatus;
  // set group(value) => model.group = value;

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

  init() {}
}
