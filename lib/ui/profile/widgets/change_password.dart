import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/authenication/register/widgets/custom_rounded_loading_button.dart';
import 'package:cool_alert/cool_alert.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  static String id = "ChangePasswordScreen";

  final oldPassFocusNode = FocusNode();
  final newPassFocusNode = FocusNode();
  final newPassRetypeFocusNode = FocusNode();

  String oldPass = "";
  String newPass = "";
  String newRetypePass = "";

  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final newPassRetypeController = TextEditingController();

  final sendChangePasswordButtonController = RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text("Change Password"),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: Color(0xffc1c2c6).withOpacity(0.2),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            SvgPicture.asset(
              "assets/images/forgot_password.svg",
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 26),
              child: Text(
                "Change your password account",
                style: kBigTitleTextStyle.copyWith(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Column(
                children: [
                  TextFormField(
                    focusNode: oldPassFocusNode,
                    onChanged: (value) {
                      oldPass = value;
                    },
                    cursorColor: kTextColor,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Password is empty';
                      }
                      return null;
                    },
                    controller: oldPassController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.mail_outline_outlined,
                        color: Colors.black,
                      ),
                      hintText: "Password",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: kPrimaryColor, width: 1),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    focusNode: newPassFocusNode,
                    onChanged: (value) {
                      newPass = value;
                    },
                    cursorColor: kTextColor,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'New password is empty';
                      } else if (!kPasswordRegex.hasMatch(text))
                        return 'Minimum six characters, at least one uppercase letter,\n '
                            'one lowercase letter, one number and one special character!';
                      return null;
                    },
                    controller: newPassController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.mail_outline_outlined,
                        color: Colors.black,
                      ),
                      hintText: "New Password",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: kPrimaryColor, width: 1),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    focusNode: newPassRetypeFocusNode,
                    onChanged: (value) {
                      newRetypePass = value;
                    },
                    cursorColor: kTextColor,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'New Retype Password is empty';
                      } else if (text != newPass)
                        return 'Password does not match!';
                      return null;
                    },
                    controller: newPassRetypeController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.mail_outline_outlined,
                        color: Colors.black,
                      ),
                      hintText: "New Retype Password",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: kPrimaryColor, width: 1),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.black, width: 1),
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
            CustomRoundedLoadingButton(
              text: 'Confirm',
              onPress: () {
                //login click
                // Provider.of<LoginViewModel>(context, listen: false)
                //     .loginWithEmailAndPassword((message) {
                //   if (message != null) {
                //     CoolAlert.show(
                //         context: context,
                //         type: CoolAlertType.error,
                //         text: 'Sign in failed!\nError: $message',
                //         onConfirmBtnTap: () {
                //           loginButtonController.reset();
                //           Navigator.of(context).pop();
                //         });
                //   } else {
                //     loginButtonController.success();
                //   }
                // });
              },
              controller: sendChangePasswordButtonController,
              horizontalPadding: 45,
            ),
          ],
        ),
      ),
    );
  }
}
