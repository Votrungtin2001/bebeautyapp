import 'package:bebeautyapp/ui/chat_user/chat.dart';
import 'package:bebeautyapp/ui/home/payment/complete_order.dart';
import 'package:bebeautyapp/ui/home/payment/error_order.dart';
import 'package:bebeautyapp/ui/order_checkout/myorder.dart';
import 'package:bebeautyapp/ui/order_checkout/widget/product_container.dart';
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
