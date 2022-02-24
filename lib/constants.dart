import 'dart:ui';

import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFFA0A0);
const kSecondaryColor = Color(0xFF262A53);
const kThirdColor = Color(0xFF628395);
const kFourthColor = Color(0xFFFFE3E3);
const kTextColor = Color(0xFF333333);
const kTextLightColor = Color(0xFFACACAC);
const kFacebookColor = Color(0xff4267B2);

const kDefaultPadding = 20.0;

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA0A0), Color(0xFFFFE3E3)],
);

const kAppNameTextPink = Text(
  'BEBEAUTY',
  style: TextStyle(
    fontFamily: 'Laila',
    fontWeight: FontWeight.bold,
    fontSize: 36,
    color: kPrimaryColor,
  ),
);

const kAppNameTextPinksm = Text(
  'BEBEAUTY',
  style: TextStyle(
    fontFamily: 'Laila',
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: kPrimaryColor,
  ),
);

const kAppNameTextSlogan = Text(
  'Be beauty because you are worth it!',
  textAlign: TextAlign.center,
  style: TextStyle(
    fontFamily: 'Laila',
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: kTextColor,
  ),
);

const kTitleTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
    color: kTextColor,
    fontSize: 14);

const kBigTitleTextStyle = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w700,
  fontSize: 24,
);

const kPop400TextStyle = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
  fontSize: 16,
);

// Form Error
final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final kPasswordRegex = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$");
final kPhoneNumber = RegExp(r"^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$");
final kNameRegex = RegExp(r"^[a-zA-Z]+(([ ][a-zA-Z ])?[a-zA-Z]*)*$");

const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

