import 'package:bebeautyapp/contants.dart';
import 'package:bebeautyapp/model/user/beauty_user.dart';
import 'package:bebeautyapp/repo/bebeauty_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterViewModel extends ChangeNotifier {
  var displayNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var retypePasswordController = TextEditingController();
  var registerButtonController = RoundedLoadingButtonController();

  void reset() {
    displayNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    retypePasswordController = TextEditingController();
    registerButtonController = RoundedLoadingButtonController();

  }

  String? emailValidate(String email) {
    if (!emailValidatorRegExp.hasMatch(email)) return 'Invalid email!';
    return null;
  }

  String? passwordValidate(String password) {
    if (!kPasswordRegex.hasMatch(password)) return 'Invalid password!';
    return null;
  }

  String? phoneNumberValidate(String phoneNumber){
    if (!kPhoneNumber.hasMatch(phoneNumber)) return 'Invalid Phone Number!';
    return null;
  }

  String? passwordRetypeValidate(String retypePassword) {
    if (passwordController.text != retypePassword)
      return 'Password does not match!';
    return null;
  }

  bool signUpClick() {
    if (emailController.text.isNotEmpty &&
        displayNameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        retypePasswordController.text.isNotEmpty) return true;
    if (emailValidate(emailController.text) == null &&
        passwordValidate(passwordController.text) == null &&
        passwordRetypeValidate(retypePasswordController.text) == null)
      return true;
    return false;
  }
}
