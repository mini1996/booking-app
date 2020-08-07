import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:bookingapp/app/screens/login/login.controller.dart';
import 'package:bookingapp/utils/loader.dart';

import 'package:bookingapp/constants/app_theme.dart';
import 'package:bookingapp/constants/strings.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {
  _LoginScreenState() : super(Controller());
  Controller _controller;
  bool _passwordVisible = false;

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

  TextStyle customTextStyle() {
    return TextStyle(
        color: AppColors.textPrimaryColor,
        fontSize: Theme.of(context).textTheme.body1.fontSize);
  }

  InputDecoration customTextDecoration(
      String text, IconData icon, BuildContext context,
      {secure: false}) {
    return InputDecoration(
      labelStyle: TextStyle(color: AppColors.textSecondaryColor),
      labelText: text,
      prefixIcon: Icon(icon, color: Theme.of(context).iconTheme.color),
      suffixIcon: secure == true
          ? IconButton(
              icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  semanticLabel:
                      _passwordVisible ? 'hide password' : 'show password',
                  color: AppColors.greyColorTemp),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                  print("Icon button pressed $_passwordVisible");
                });
              })
          : null,
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColorTemp)),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).iconTheme.color)),
      errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).errorColor)),
    );
  }

  Widget customSizeBox({double height}) {
    return SizedBox(
      height: height,
    );
  }

  Widget loginButton(BuildContext context) {
    // globals.context = context;
    return _controller.isLoading
        ? CircularProgressIndicator(
            strokeWidth: 1.5, backgroundColor: AppColors.white)
        : SizedBox(
            height: 45.0,
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).iconTheme.color,
              child: Text(
                Strings.loginButton,
                style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: Theme.of(context).textTheme.title.fontSize),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {
                _controller.onLoginPressed(context);
              },
            ),
          );
  }

  Widget loginUi() {
    return Form(
      key: _controller.formKey,
      autovalidate: _controller.isAutoValidateMode,
      child: Column(
        children: <Widget>[
          customSizeBox(height: 150.0),
          Container(
            //height: 50.0,
            child: Text(
              Strings.appName,
              style: TextStyle(
                  color: AppColors.textPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          customSizeBox(height: 40.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _controller.userNameController,
                  enabled: true,
                  focusNode: _controller.usernameNode,
                  style: customTextStyle(),
                  cursorColor: Theme.of(context).iconTheme.color,
                  textInputAction: TextInputAction.next,
                  decoration: customTextDecoration(
                      Strings.usernameLabel, Icons.person, context),
                  textCapitalization: TextCapitalization.none,
                  onFieldSubmitted: (term) {
                    fieldFocusChange(context, _controller.usernameNode,
                        _controller.passwordNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return Strings.usernameEmptyMessage;
                    }
                  },
                  onSaved: (String value) {
                    _controller.loginData["username"] = value;
                  },
                ),
                TextFormField(
                  enabled: true,
                  controller: _controller.passwordController,
                  obscureText: !_passwordVisible,
                  textInputAction: TextInputAction.done,
                  style: customTextStyle(),
                  cursorColor: Theme.of(context).iconTheme.color,
                  focusNode: _controller.passwordNode,
                  decoration: customTextDecoration(
                      Strings.passwordLabel, Icons.lock, context,
                      secure: true),
                  validator: (value) {
                    if (value.isEmpty) {
                      return Strings.passwordEmptyMessage;
                    }
                  },
                  onSaved: (String value) {
                    _controller.loginData["password"] = value;
                  },
                  onFieldSubmitted: (term) {
                    _controller.passwordNode.unfocus();
                    // _controller.onLoginPressed(context);
                  },
                ),
                customSizeBox(height: 2.0),
                InkWell(
                    onTap: () async {
                      //  _controller.dispose();
                      // var response = await _router
                      //     .navigate(Pages.forgotPasswordScreen, context, {});
                      // _controller.formKey = GlobalKey<FormState>();
                    },
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          Strings.forgotPasswordButton,
                          style: TextStyle(
                              color: AppColors.textPrimaryColor, fontSize: 14),
                        ))),
                customSizeBox(height: 15.0),
                Text(
                  _controller.errorMessage ?? "",
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
                customSizeBox(height: 2.0),
                loginButton(context),
                customSizeBox(height: 30.0),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: loginUi(),
      ),
    );
  }

  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  forgotpasswordTapped() {
    // getContacts();
    Navigator.pushNamed(context, '/forgotPassword');
  }
}
