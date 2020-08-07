import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:bookingapp/app/screens/template/template.controller.dart';
import 'package:bookingapp/utils/loader.dart';

class TemplateScreen extends StatefulWidget {
  TemplateScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _TemplateScreenState createState() => _TemplateScreenState();
}

class _TemplateScreenState extends StateMVC<TemplateScreen> {
  _TemplateScreenState() : super(Controller());
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
    return Scaffold(
      body: Center(
        child: Loader.loader(context),
      ),
    );
  }
}
