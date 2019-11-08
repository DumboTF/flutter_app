import 'package:flutter/material.dart';
import 'package:flutter_app/ui/input.dart';
import 'package:flutter_app/ui/input2.dart';
import 'package:flutter_app/ui/popup.dart';
import 'package:flutter_app/ui/splash_page.dart';

void main() {
  runApp(NameRouter.initApp());
}

class NameRouter {
  static Map<String, WidgetBuilder> routes;

  static Widget initApp() {
    return MaterialApp(
      initialRoute: '/',
      routes: initRoutes(),
    );
  }

  static initRoutes() {
    routes = {
      '/': (context) => SplashPage(),
      '/input': (context) => EditText(),
      '/input2': (context) => EditText2(),
      '/popup': (context) => TfPopup()
    };
    return routes;
  }
}
