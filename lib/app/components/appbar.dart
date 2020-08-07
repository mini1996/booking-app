import 'package:flutter/material.dart';
import 'package:bookingapp/router.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  String title;
  AppbarWidget({Key key, this.title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  AppbarWidgetState createState() {
    return AppbarWidgetState(
      title: title,
    );
  }

  @override
  // TODO: implement preferredSize
  final Size preferredSize;
}

class AppbarWidgetState extends State<AppbarWidget> {
  final String title;
  AppbarWidgetState({
    this.title,
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Router _router = Router();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {
              return null;
            })
      ],
    );
  }
}
