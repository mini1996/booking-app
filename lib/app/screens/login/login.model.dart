import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bookingapp/app/domain/repository/auth_screen/auth_screen.respository.dart';

class Model {
  Model(this.loginRepo);
  bool isLoading = false;
  bool isAutoValidateMode = false;
  FocusNode usernameNode;
  FocusNode passwordNode;
  String errorMessage;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  AuthScreenRepository loginRepo;

  login(loginData) async {
    return await loginRepo.loginUser(loginData);
  }
}
