import 'package:bebeautyapp/MVC/controller/authentication/signUp.dart';
import 'package:bebeautyapp/main.dart';
import 'package:bebeautyapp/model/login/register_view_model.dart';
import 'package:bebeautyapp/ui/authenication/login/login_screen.dart';

import 'package:bebeautyapp/ui/authenication/login/widgets/rounded_input_field.dart';
import 'package:bebeautyapp/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bebeautyapp/ui/authenication/login/widgets/rounded_password_field.dart';


class RegisterScreen extends StatelessWidget {
  static String id = 'RegisterScreen';

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final retypePasswordFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final nameFocusNode = FocusNode();

  String email = "";
  String displayName = "";
  String phone = "";
  String password = "";
  String rePassword = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: kAppNameTextPink,

              ),
              Container(
                height: MediaQuery.of(context).size.height - 100,
                decoration: BoxDecoration(
                  color: kFourthColor.withOpacity(0.2),

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Create Account',
                        style: kBigTitleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          RoundedInputField(
                            hintText: "Email",
                            icon: Icons.mail_outline_outlined,
                            focusNode: emailFocusNode,
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                          RoundedInputField(
                            hintText: "Display Name",
                            icon: Icons.person,
                            focusNode: nameFocusNode,
                            onChanged: (value) {
                              displayName = value;
                            },
                          ),
                          RoundedInputField(
                            hintText: "Phone Number",
                            focusNode: phoneNumberFocusNode,
                            icon: Icons.phone_android_rounded,
                            onChanged: (value) {
                              phone = value;
                            },
                          ),

                          RoundedPasswordField(
                            hintText: "Password",
                            focusNode: passwordFocusNode,
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                          RoundedPasswordField(
                            hintText: "Re-Enter Password",
                            focusNode: retypePasswordFocusNode,
                            onChanged: (value) {
                              rePassword = value;
                            },
                          ),

                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                    ),
                                    child: InkWell(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 290,
                                              height: 60,
                                              child:   OutlineButton(
                                                child: Text('Sign Up', style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold,fontSize: 24)),
                                                borderSide: BorderSide(
                                                  color: kPrimaryColor,
                                                  style: BorderStyle.solid,
                                                  width: 3,
                                                ),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                                onPressed: (){
                                                  //Validate
                                                  if (1==1) {
                                                    Future<bool> result = SignUp_Controller().createUser(email, displayName, phone, password);
                                                    if(result == true) {
                                                      // Clear text ở các textfield

                                                      print("Created Account Successfully");
                                                    }
                                                  }

                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                            child: RichText(
                              text: TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: kTextColor,
                                    fontFamily: 'Poppins',
                                  ),
                                  children: [
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => LoginScreen()),
                                          );
                                        },
                                      text: 'Sign In',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: kPrimaryColor,
                                        fontFamily: 'Poppins',
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
