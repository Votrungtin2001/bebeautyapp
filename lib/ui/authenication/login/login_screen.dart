import 'package:bebeautyapp/MVC/controller/authentication/signIn.dart';
import 'package:bebeautyapp/ui/authenication/register/register_screen.dart';
import 'package:bebeautyapp/ui/authenication/register/widgets/custom_rounded_loading_button.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:bebeautyapp/ui/home/main_screen.dart';
import 'package:bebeautyapp/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'forgot_password_screen.dart';

import 'widgets/login_with_button.dart';
import 'package:bebeautyapp/ui/authenication/login/widgets/rounded_input_field.dart';
import 'package:bebeautyapp/ui/authenication/login/widgets/rounded_password_field.dart';

class LoginScreen extends StatelessWidget {

  static String id = 'LoginScreen';
  final loginButtonController = RoundedLoadingButtonController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  String email = "";
  String password = "";

  // manage state of modal progress HUD widget
  bool _isInAsyncCall = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          //inAsyncCall: Provider.of<LoginViewModel>(context).isLoading,
          progressIndicator: Center(
            child: SpinKitFoldingCube(
              color: kPrimaryColor,
              size: 50,
            ),
          ),
          inAsyncCall: _isInAsyncCall,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                kAppNameTextPink,
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120,right: 120),
                  child: kAppNameTextSlogan,
                ),

                SizedBox(
                  height: 10,
                ),

                RoundedInputField(
                  hintText: "Your Email",
                  icon: Icons.mail_outline_outlined,
                  focusNode: emailFocusNode,
                  onChanged: (value) {
                    email = value;
                  },
                ),

                RoundedPasswordField(
                  hintText: "Password",
                  focusNode: passwordFocusNode,
                  onChanged: (value) {
                    password = value;
                  },
                ),

                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                      );
                    },
                    child: const Text(
                      "Forgot password?",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 15,
                        color: kPrimaryColor,
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                CustomRoundedLoadingButton(
                  text: 'Sign In',
                  onPress: () async {
                   int result = await SignIn_Controller().logInWithEmailAndPassword(email, password) as int;
                   if(result == 0) { // sign in as admin
                      // Open Home Page for admin
                     print("Sign in as admin");
                     Fluttertoast.showToast(msg: 'Logged in successfully.', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
                     loginButtonController.success();
                   }
                   else if (result == 1) { //sign in as user
                     // Open Home Page for user
                     print("Sign in as user");
                     Fluttertoast.showToast(msg: 'Logged in successfully.', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
                     loginButtonController.success();
                     Navigator.push(
                         context, MaterialPageRoute(builder: (context) => MainScreen()));
                   }
                   else {
                     print("Failed sign in");
                     loginButtonController.stop();
                   }
                  },
                  controller: loginButtonController,
                  horizontalPadding: 45,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Don’t have an account? ',
                      style: TextStyle(
                        fontSize: 15,
                        color: kTextColor,
                        fontFamily: 'Poppins',
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //register click
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                              );
                            },
                          text: 'Register now',
                          style: TextStyle(
                            fontSize: 15,
                            color: kPrimaryColor,
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Divider(
                          color: Colors.black54,
                          thickness: 1,
                        ),
                      ),
                      Text(
                        '    Or    ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Divider(
                          color: Colors.black54,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                LoginWithButton(
                  icon: FontAwesomeIcons.google,
                  iconColor: Colors.red,
                  text: 'Sign in with Google',
                  isOutLine: true,
                  textColor: Colors.black54,
                  color: Colors.white,
                  onPress: () {
                    print("ok");

                  },
                ),
                SizedBox(
                  height: 10,
                ),
                LoginWithButton(
                  icon: FontAwesomeIcons.facebook,
                  iconColor: Colors.white,
                  text: 'Login with Facebook',
                  isOutLine: false,
                  textColor: Colors.white,
                  color: kFacebookColor,
                  onPress: () {
                    //TODO fb login click
                    // Provider.of<LoginViewModel>(context, listen: false)
                    //     .onFacebookSignInClick();
                  },
                ),
                SizedBox(
                  height: 24,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
