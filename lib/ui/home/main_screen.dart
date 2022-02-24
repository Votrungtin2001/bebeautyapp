
import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/chat/chat_screen.dart';
import 'package:bebeautyapp/ui/home/details/details_screen.dart';
import 'package:bebeautyapp/ui/home/homes/home.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/categories.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/item_card.dart';
import 'package:bebeautyapp/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _home = HomeScreens();
  Widget _chat = ChatScreens();
  Widget _profile = ProfileScreens();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        currentIndex: selectedIndex,
        unselectedFontSize: 12,
        selectedFontSize: 14,
        selectedItemColor : kPrimaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_rounded),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
  Widget getBody( )  {
    if(selectedIndex == 0) {
      return _home;
    } else if(selectedIndex==1) {
      return _chat;
    } else {
      return _profile;
    }
  }
  void onTapHandler(int index)  {
    setState(() {
      selectedIndex = index;
    });
  }
}

