import 'dart:io';

import 'package:badges/badges.dart';
import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/model/user/MUser.dart';
import 'package:bebeautyapp/repo/providers/user_provider.dart';
import 'package:bebeautyapp/ui/authenication/login/login_screen.dart';
import 'package:bebeautyapp/ui/home/homes/cart/cart_screens.dart';
import 'package:bebeautyapp/ui/profile/widgets/address.dart';
import 'package:bebeautyapp/ui/profile/widgets/address_screens.dart';
import 'package:bebeautyapp/ui/profile/widgets/change_avatar_dialog.dart';
import 'package:bebeautyapp/ui/profile/widgets/change_infomation.dart';
import 'package:bebeautyapp/ui/profile/widgets/change_password.dart';
import 'package:bebeautyapp/ui/profile/widgets/favirite_list_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreens extends StatefulWidget {
  @override
  _ProfileScreens createState() => _ProfileScreens();
}

class _ProfileScreens extends State<ProfileScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profile"),
        titleTextStyle: TextStyle(color: kPrimaryColor,fontSize: 18,fontFamily: 'Poppins',fontWeight: FontWeight.w500),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xffc1c2c6).withOpacity(0.2),
      body: SingleChildScrollView(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
        height: 115,
        width: 115,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/avt.png"),
            ),
            Positioned(
              right: -16,
              bottom: 0,
              child: SizedBox(
                height: 46,
                width: 46,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: Color(0xFFF5F6F9),
                  onPressed: ()async {
                    ImageSource source = await showDialog(
                      context: context,
                      builder: (context) => ChangeAvatarDialog(),
                    );
                  },
                  child: SvgPicture.asset("assets/icons/camera.svg"),
                ),
              ),
            )
          ],
        ),
      ),
        SizedBox(height: 15,),
        ProfileMenu(
          text: "Purchase order",
          icon: "assets/icons/menu-order.svg",
          press: () { },
        ),
        SizedBox(height: 2,),
        Container(
         width: MediaQuery.of(context).size.width,
          color: Colors.white,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OrderMenu(
                  text: "To Pay",
                  icon: "assets/icons/check.svg",
                  press: () {},
              ),
              OrderMenu(
                text: "To Ship",
                icon: "assets/icons/package.svg",
                press: () {},
              ),
              OrderMenu(
                text: "To Receive",
                icon: "assets/icons/delivery.svg",
                press: () {},
              ),
              OrderMenu(
                text: "To Rate",
                icon: "assets/icons/star-rate.svg",
                press: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        ProfileMenu(
          text: "My Profile",
          icon: "assets/icons/user_icon.svg",
          press: () {Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
          );},
        ),
        SizedBox(height: 8),
        ProfileMenu(
          text: "My Address",
          icon: "assets/icons/location.svg",
          press: () {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddressScreens()),
          );},
        ),
        SizedBox(height: 8),
        ProfileMenu(
          text: "Favorite List",
          icon: "assets/icons/heart.svg",
          press: () {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoriteListScreens()),
          );},
        ),
        SizedBox(height: 8),
        ProfileMenu(
          text: "Settings",
          icon: "assets/icons/settings.svg",
          press: () {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
          );},
        ),
        SizedBox(height: 8),
        ProfileMenu(
          text: "Log Out",
          icon: "assets/icons/log_out.svg",
          press: () { signOutDrawer(context);},
        ),
        SizedBox(height: 30),
          ],
        ),
    ),
    ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          backgroundColor: Colors.white,
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: kPrimaryColor,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      );
  }
}

class OrderMenu extends StatelessWidget {
  const OrderMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
        ),
        onPressed: press,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              badgeColor: kPrimaryColor,
              animationType: BadgeAnimationType.slide,
              badgeContent: Text('3',style: TextStyle(color: Colors.white),),
              child: SvgPicture.asset(
                icon,
                color: kPrimaryColor,
                width: 24,
              ),
            ),
            SizedBox(height: 8,),
            Expanded(child: Text(text,style: TextStyle(fontSize: 14),textAlign: TextAlign.center,)),
          ],
        ),
      ),
    );
  }
}

void signOutDrawer(BuildContext context) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0)
        ),
      ),
      isDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          height: 150.0,
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Are you sure you want Logout ?',
                style: TextStyle(
                  color:  kTextColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                    onPressed: () {Navigator.of(context).pop();},
                    child: Text("NO",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {

                    },
                    color: kPrimaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "YES",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      });
}