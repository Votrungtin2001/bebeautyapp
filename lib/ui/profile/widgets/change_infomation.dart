import 'package:bebeautyapp/constants.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileScreens createState() => _ProfileScreens();
}

class _ProfileScreens extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Profile"),
          titleTextStyle: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Poppins',fontWeight: FontWeight.w700),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: ListView(
          children: <Widget>[
            TextFormField(
              onChanged: (value) {

              },
              cursorColor: kTextColor,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Email is empty';
                }else if (!emailValidatorRegExp.hasMatch(text)) return 'Invalid email!';
                return null;
              },

              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.mail_outline_outlined,
                  color: Colors.black,
                ),
                hintText: "Email",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: Colors.black,
                      width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}