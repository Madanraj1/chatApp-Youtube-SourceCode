import 'package:chatapp/UI/profile/profileScreen.dart';
import 'package:chatapp/chats/ChatScreen.dart';
import 'package:flutter/material.dart';

BottomNavigationBar buildBottomNavigationBar(_selectedIndex, context) {
  return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        if (_selectedIndex != value) {
          if (value == 3) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => ChatScreen()));
          }
        }

        _selectedIndex = value;
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: "Camera"),
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/6474492/pexels-photo-6474492.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
          ),
          label: "Profile",
        ),
      ]);
}
