
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:posrgresql_flutter/pages/login_page.dart';

import '../pages/profile_page.dart';
import '../pages/registration_page.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    log('This is route : ${settings.name}');
    switch (settings.name) {
      case LoginPage.routeName:
        return _FadeRoute(child: LoginPage.create(), time: 0);
      case ProfilePage.routeName:
        return _FadeRoute(child: ProfilePage.create(), time: 0);
      case RegistrationPage.routeName:
        return _FadeRoute(child: RegistrationPage.create(), time: 0);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final int time;

  _FadeRoute({
    required this.child,
    required this.time,
  }) : super(
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          ) =>
      child,
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
          ) =>
          FadeTransition(
            opacity: animation,
            child: child,
          ),
      transitionDuration: Duration(milliseconds: time));
}
