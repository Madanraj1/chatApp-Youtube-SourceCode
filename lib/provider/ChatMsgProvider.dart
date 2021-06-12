import 'package:chatapp/helper/Profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatMsgProvider with ChangeNotifier {
  List<Profile> allUsers = [];
  get getAllUsers => allUsers;

  Future getAllChatUsers() async {
    allUsers = [];

    List data;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uid = prefs.getString("uid");
    await FirebaseFirestore.instance.collection("user").get().then((value) {
      data = value.docs;

      data.forEach((element) {
        if (element['uid'] != uid) {
          allUsers.add(Profile(
              name: element['Name'],
              profilePic: element['profilePic'],
              uid: element['uid'],
              phoneNumber: element['PhoneNumber']));
        }
      });
    });

    notifyListeners();
  }
}
