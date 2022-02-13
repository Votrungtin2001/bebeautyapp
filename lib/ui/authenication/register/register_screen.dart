import 'package:bebeautyapp/repo/function/sign_in.dart';
import 'package:bebeautyapp/repo/function/sign_up.dart';
import 'package:bebeautyapp/main.dart';
import 'package:bebeautyapp/model/login/register_view_model.dart';
import 'package:bebeautyapp/ui/authenication/login/login_screen.dart';
import 'package:bebeautyapp/ui/authenication/login/widgets/rounded_input_field.dart';
import 'package:bebeautyapp/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RegisterScreen extends StatefulWidget {
  static String id = 'RegisterScreen';

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final retypePasswordFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final nameFocusNode = FocusNode();

  final signUpFunctions = new SignUp_Function();

  String email = "";
  String displayName = "";
  String phone = "";
  String password = "";
  String rePassword = "";
  @override
  _RegisterScreen createState() => new _RegisterScreen();
}
class _RegisterScreen extends State<RegisterScreen> {
  // manage state of modal progress HUD widget
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  height: MediaQuery.of(context).size.height - 30,
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
                        padding: const EdgeInsets.symmetric(vertical: 15),
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
                            // RoundedInputField(
                            //   hintText: "Email",
                            //   icon: Icons.mail_outline_outlined,
                            //   textController: Provider.of<SignUp_Function>(context, listen: false)
                            //       .emailController,
                            //   validator: Provider.of<SignUp_Function>(context, listen: false)
                            //       .emailValidate,
                            //   focusNode: widget.emailFocusNode,
                            //   onChanged: (value) {
                            //     widget.email = value;
                            //   },
                            //   onFieldSubmitted: (text) =>
                            //       widget.nameFocusNode.requestFocus(),
                            // ),
                            // RoundedInputField(
                            //   hintText: "Display Name",
                            //   icon: Icons.person,
                            //   textController: Provider.of<SignUp_Function>(context, listen: false)
                            //       .displayNameController,
                            //   validator: Provider.of<SignUp_Function>(context, listen: false)
                            //       .nameValidate,
                            //   focusNode: widget.nameFocusNode,
                            //   onFieldSubmitted: (text) =>
                            //       widget.phoneNumberFocusNode.requestFocus(),
                            //   onChanged: (value) {
                            //     widget.displayName = value;
                            //   },
                            // ),
                            // RoundedInputField(
                            //   hintText: "Phone Number",
                            //   focusNode: widget.phoneNumberFocusNode,
                            //   textController: Provider.of<SignUp_Function>(context, listen: false)
                            //       .phoneNumberController,
                            //   validator: Provider.of<SignUp_Function>(context, listen: false)
                            //       .phoneNumberValidate,
                            //   icon: Icons.phone_android_rounded,
                            //   onFieldSubmitted: (text) =>
                            //       widget.passwordFocusNode.requestFocus(),
                            //   onChanged: (value) {
                            //     widget.phone = value;
                            //   },
                            // ),

                                TextFormField(
                                focusNode: widget.emailFocusNode,
                                onChanged: (value) {
                                  widget.email = value;
                                },
                                cursorColor: kTextColor,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Email is empty';
                                  }else if (!emailValidatorRegExp.hasMatch(text)) return 'Invalid email!';
                                  return null;
                                },
                                controller: Provider.of<SignUp_Function>(context, listen: false)
                                    .emailController,
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




                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                                focusNode: widget.nameFocusNode,
                                onChanged: (value) {
                                  widget.displayName = value;
                                },
                                cursorColor: kTextColor,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Name is empty';
                                  }
                                  return null;
                                },
                                controller: Provider.of<SignUp_Function>(context, listen: false)
                                    .displayNameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  hintText: "Display name",
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
                            SizedBox(
                              height: 15,
                            ),
                           TextFormField(
                                focusNode: widget.phoneNumberFocusNode,
                                onChanged: (value) {
                                  widget.phone = value;
                                },
                                cursorColor: kTextColor,
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Phone number is empty';
                                  } else  if (!kPhoneNumber.hasMatch(text)) return 'Invalid Phone Number!';
                                  return null;
                                },
                                controller: Provider.of<SignUp_Function>(context, listen: false)
                                    .phoneNumberController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.phone_android_rounded,
                                    color: Colors.black,
                                  ),
                                  hintText: "Phone number",
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
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                                obscureText: _obscureText1,
                                onChanged:   (value) {widget.password = value;},
                                focusNode: widget.passwordFocusNode,
                                controller: Provider.of<SignUp_Function>(context, listen: false)
                                    .passwordController,
                                validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Password is empty';
                                }
                                return null;
                                },
                                cursorColor: kTextColor,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText1
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _obscureText1 = !_obscureText1;
                                      });
                                    },
                                  ),
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
                              SizedBox(
                                height: 15,
                              ),
                            TextFormField(
                                obscureText: _obscureText2,
                                onChanged:   (value) {widget.rePassword = value;},
                                focusNode: widget.retypePasswordFocusNode,
                                controller: Provider.of<SignUp_Function>(context, listen: false)
                                    .retypePasswordController,
                                cursorColor: kTextColor,
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Re-Password is empty';
                                }else if (text != widget.password ) return 'Password does not match!';
                                return null;
                              },
                                decoration: InputDecoration(
                                  hintText: "Re-Enter Password",
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureText2
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _obscureText2 = !_obscureText2;
                                      });
                                    },
                                  ),
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

                            // RoundedPasswordField(
                            //   hintText: "Password",
                            //   focusNode: passwordFocusNode,
                            //   textController: Provider.of<SignIn_Function>(context, listen: false)
                            //       .passwordController,
                            //   onChanged: (value) {
                            //     password = value;
                            //   },
                            // ),
                            // RoundedPasswordField(
                            //   hintText: "Re-Enter Password",
                            //   focusNode: retypePasswordFocusNode,
                            //   textController: Provider.of<SignIn_Function>(context, listen: false)
                            //       .passwordController,
                            //   onChanged: (value) {
                            //     rePassword = value;
                            //   },
                            // ),

                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
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
                                                    if (_formKey.currentState!.validate()) {
                                                      _formKey.currentState!.save();
                                                    }
                                                    if (1==1) {
                                                      Future<bool> result = widget.signUpFunctions.createUser(widget.email, widget.displayName, widget.phone, widget.password);
                                                      if(result == true) {
                                                        // Clear text ở các textfield
                                                        Provider.of<SignUp_Function>(context, listen: false)
                                                            .emailController.clear();
                                                        Provider.of<SignUp_Function>(context, listen: false)
                                                            .displayNameController.clear();
                                                        Provider.of<SignUp_Function>(context, listen: false)
                                                            .phoneNumberController.clear();
                                                        Provider.of<SignUp_Function>(context, listen: false)
                                                            .passwordController.clear();
                                                        Provider.of<SignUp_Function>(context, listen: false)
                                                            .retypePasswordController.clear();
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
                                padding: const EdgeInsets.only(top: 15),
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
      ),
    );
  }
}
