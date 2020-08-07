import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:bookingapp/app/app.controller.dart';
import 'package:bookingapp/app/data/repository/auth_screen/data_auth_screen_respository.dart';
import 'package:bookingapp/app/screens/login/login.model.dart';
import 'package:bookingapp/constants/pages.dart';
import 'package:bookingapp/router.dart';
import 'package:bookingapp/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Map loginData = {"username": "", "password": ""};

  Model model = Model(DataAuthScreenRepository());
  Router _router = Router();
  FocusNode get usernameNode => model.usernameNode;
  FocusNode get passwordNode => model.passwordNode;
  get isLoading => model.isLoading;
  get formKey => model.formKey;
  bool get isAutoValidateMode => model.isAutoValidateMode;
  get userNameController => model.userNameController;
  get passwordController => model.passwordController;

  set isAutoValidateMode(boolean) => model.isAutoValidateMode = boolean;
  set isLoading(value) => model.isLoading = value;

  //  get pageStatus => model.pageStatus;
  // set group(value) => model.group = value;
  get errorMessage => model.errorMessage;
  set errorMessage(value) => model.errorMessage = value;

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

  void onLoginPressed(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      login(context);
    } else {
      setState(() {
        isAutoValidateMode = true;
      });
    }
    // _router.navigate(Pages.fetchingScreen, this.stateMVC.context, {});
    // Navigator.pushReplacementNamed(this.stateMVC.context, Pages.mainScreen);
  }

  void login(BuildContext context) async {
    var data = jsonEncode({
      "password": loginData["password"],
      "username": loginData["username"],
      "grant_type": "password",
    });
    print('login data ${data}');
    setState(() {
      isLoading = true;
    });
    SharedPreferences mySharedPreferences =
        await SharedPreferences.getInstance();
    var response = await model.login(data);
    print("responselogin${response}");
    if (response["success"]) {
      if (response['data']['role_id'] == 4) {
        print(response['data']);
        var authToken = response['data']['access_token'];
        var userId = response['data']['id'];
        var refreshToken = response['data']['refresh_token'];
        print(refreshToken);
        var userRole = response['data']['role_id'];
        var userName = response['data']['firstname'];
        print("$authToken");
        mySharedPreferences.setString('authToken', authToken);
        mySharedPreferences.setString('idOfUser', userId.toString());
        mySharedPreferences.setString('refreshToken', refreshToken);
        mySharedPreferences.setString('userRole', userRole.toString());
        mySharedPreferences.setString('userName', userName.toString());
        setState(() {
          isLoading = false;
        });
        print("Login success. Taking to next page");
        // _router.navigate(Pages.fetchingScreen, this.stateMVC.context, {});
      } else {
        setState(() {
          isLoading = false;
          model.errorMessage = "Please use Warehouse Login";
        });
        userNameController.addListener(() {
          setState(() {
            model.errorMessage = null;
          });
        });
        passwordController.addListener(() {
          setState(() {
            model.errorMessage = null;
          });
        });
      }
    } else {
      setState(() {
        isLoading = false;
        model.errorMessage = response["data"] != null
            ? response["data"]["errors"]["message"]
            : response["message"];
      });
      userNameController.addListener(() {
        setState(() {
          model.errorMessage = null;
        });
      });
      passwordController.addListener(() {
        setState(() {
          model.errorMessage = null;
        });
      });
    }
  }
}
