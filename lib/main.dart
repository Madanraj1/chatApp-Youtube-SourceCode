import 'package:chatapp/UI/auth/loginScreen.dart';
import 'package:chatapp/chats/ChatScreen.dart';
import 'package:chatapp/constant.dart';
import 'package:chatapp/provider/ChatMsgProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/userRelatedTasks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedScreen = 0;

  List screens = [
    LoginScreen(),
    ChatScreen(),
  ];

  void checkUserAlreadyLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var uid = prefs.getString("uid");

    if (uid != null) {
      setState(() {
        selectedScreen = 1;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkUserAlreadyLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserRelatedTasks(),
        ),
        ChangeNotifierProvider.value(
          value: ChatMsgProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkThemeData(context),
        home: screens[selectedScreen],
      ),
    );
  }
}
