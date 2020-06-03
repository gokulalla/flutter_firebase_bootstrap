import 'package:flutter/material.dart';
import 'screens/Login/index.dart';
import 'screens/SignUp/index.dart';
import 'screens/Home/index.dart';
import 'theme/style.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/Login": (BuildContext context) => new LoginScreen(),
    "/SignUp": (BuildContext context) => new SignUpScreen(),
    "/HomePage": (BuildContext context) => new HomeScreen(),
  };

  Routes() {
    runApp(new MaterialApp(
      title: "Flutter Flat App",
      home: new LoginScreen(),
      theme: appTheme,
      routes: routes,
    ));
  }
}
