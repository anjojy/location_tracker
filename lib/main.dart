import 'package:flutter/material.dart';
import 'View/LoginScreen.dart';
import 'View/User_Location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (_) => new LoginScreen(), // Login Page
        '/homepage': (_) => new HomePage(), // Home Page
      },
    );
  }
}
