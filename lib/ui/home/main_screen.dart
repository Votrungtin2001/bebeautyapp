
import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/model/user/MUser.dart';
import 'package:bebeautyapp/repo/providers/user_provider.dart';
import 'package:bebeautyapp/ui/chat/chat_screen.dart';
import 'package:bebeautyapp/ui/home/details/details_screen.dart';
import 'package:bebeautyapp/ui/home/homes/home.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/categories.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/item_card.dart';
import 'package:bebeautyapp/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _home = HomeScreens();
  Widget _chat = ChatScreens();
  Widget _profile = ProfileScreens();
  int selectedIndex = 0;

  String userID = "";

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MUser_IsNotLogout?>(context);
    final userProvider = Provider.of<UserProvider>(context);
    if(user!.uid != null) userID = user.uid.toString();
    userProvider.getUser(userID);

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

