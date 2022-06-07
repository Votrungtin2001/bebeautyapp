import 'package:bebeautyapp/repo/providers/user_provider.dart';
import 'package:bebeautyapp/ui/chat_user/chat.dart';
import 'package:bebeautyapp/ui/home/payment/widget/complete_order.dart';
import 'package:bebeautyapp/ui/home/payment/widget/error_order.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:bebeautyapp/ui/chat/chat_screen.dart';
import 'package:bebeautyapp/ui/home/homes/home.dart';
import 'package:bebeautyapp/ui/profile/profile_screen.dart';
import 'package:bebeautyapp/constants.dart';
import 'package:provider/provider.dart';

import 'model/user/MUser.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  String userID = "";

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MUser_IsNotLogout?>(context);
    final userProvider = Provider.of<UserProvider>(context);
    if (user!.uid != null) userID = user.uid.toString();
    if(userID == "") userProvider.getUser(userID);
    userID = userProvider.user.getID();

    List<Widget> _body = [
      HomeScreens(),
      Chat(chatRoomId: userID, user_id: userID, user_name: "Be Beauty",),
      ProfileScreens(),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Center(
        child: _body.elementAt(_page),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(
            () {
              _page = index;
            },

          );
        },
        selectedItemColor: kPrimaryColor,
        currentIndex: _page,
      ),
    );
  }
}
