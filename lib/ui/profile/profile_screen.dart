import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/profile/widgets/change_avatar_dialog.dart';
import 'package:bebeautyapp/ui/profile/widgets/change_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreens extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Profile"),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Poppins',fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
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
                    if (source == null) return;
                    // Provider.of<UserViewModel>(context, listen: false)
                    //     .onAvatarChange(source);
                  },
                  child: SvgPicture.asset("assets/icons/camera.svg"),
                ),
              ),
            )
          ],
        ),
      ),
        SizedBox(height: 20),
        ProfileMenu(
          text: "My Profile",
          icon: "assets/icons/user_icon.svg",
          press: () => {},
        ),
        ProfileMenu(
          text: "Settings",
          icon: "assets/icons/settings.svg",
          press: () {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
          );},
        ),
        ProfileMenu(
          text: "Log Out",
          icon: "assets/icons/log_out.svg",
          press: () {},
        ),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
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
      ),
    );
  }
}