import 'package:bebeautyapp/ui/chat_user/chat.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:bebeautyapp/ui/chat/chat_screen.dart';
import 'package:bebeautyapp/ui/home/homes/home.dart';
import 'package:bebeautyapp/ui/profile/profile_screen.dart';
import 'package:bebeautyapp/constants.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _page = 0;
  @override
  Widget build(BuildContext context) {

    List<Widget> _body = [
      HomeScreens(),
      ChatScreens(),
      ProfileScreens(),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromRGBO(149, 227, 253, 1.0),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.white,
        height: 70.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30.0,
            color: kSecondaryColor,
          ),

          Icon(
            Icons.chat_bubble,
            size: 30.0,
            color: kSecondaryColor,
          ),
          Icon(
            Icons.account_circle,
            size: 30.0,
            color: kSecondaryColor,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          },
          );
        },
      ),

      body: _body[_page],
    );
  }
}