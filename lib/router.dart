import 'package:flutter/material.dart';
import 'package:bookingapp/constants/pages.dart';
import 'package:bookingapp/globals.dart';
import 'app/screens/login/login.view.dart';

class Router {
  void navigate(String page, context, Map args) {
    print(page);
    Globals().navigatorKey.currentState.pushNamed(page, arguments: args);
  }

  void navigateWithReplace(String page, context, args) => Globals()
      .navigatorKey
      .currentState
      .pushReplacementNamed(page, arguments: args);

  void navigateWithReplaceUntil(String page, context, args) => Globals()
      .navigatorKey
      .currentState
      .pushNamedAndRemoveUntil(page, (Route<dynamic> route) => false);
  final RouteObserver<PageRoute> routeObserver;

  Router() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    print(settings.name);
    Globals().currentRoute = settings.name;

    switch (settings.name) {
      case Pages.loginScreen:
        return _buildRoute(settings, LoginScreen());

      default:
        return null;
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (ctx) => RouteAwareWidget(settings.name, child: builder),
    );
  }
}

class RouteAwareWidget extends StatefulWidget {
  final String name;
  final Widget child;

  RouteAwareWidget(this.name, {@required this.child});

  @override
  State<RouteAwareWidget> createState() => RouteAwareWidgetState();
}

// Implement RouteAware in a widget's state and subscribe it to the RouteObserver.
class RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Router().routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    Router().routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  // Called when the current route has been pushed.
  void didPush() {
    // print('didPush ${widget.name}');
  }

  @override
  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    // print('didPopNext ${widget.name}');
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
