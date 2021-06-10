import 'package:chatapp/UI/auth/loginScreen.dart';
import 'package:chatapp/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkThemeData(context),
      home: LoginScreen(),
    );
  }
}
