import 'package:flutter/material.dart';
import 'package:randcomments/pages/new_note/index.dart';
import 'package:randcomments/pages/note/index.dart';
import 'package:randcomments/pages/home/index.dart';
import 'package:randcomments/router/routes.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _route(HomePage());
      case noteRoute:
        return _route(NotePage(settings.arguments));
      case newNoteRoute:
        return _route(NewNotePage());
      default:
        return _route(Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ));
    }
  }

  static Route _route(Widget page) => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
}
