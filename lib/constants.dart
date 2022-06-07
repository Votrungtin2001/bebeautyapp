import 'dart:ui';

import 'package:bebeautyapp/ui/home/product_details/review_modal.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFFA0A0);
const kSecondaryColor = Color(0xFF262A53);
const kThirdColor = Color(0xFF628395);
const kFourthColor = Color(0xFFFFE3E3);
const kTextColor = Color(0xFF333333);
const kTextLightColor = Color(0xFFACACAC);
const kFacebookColor = Color(0xff4267B2);
const kCopy = Color.fromARGB(255, 14, 88, 235);
const kDefaultPadding = 20.0;

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA0A0), Color(0xFFFFE3E3)],
);

const kAppNameTextPink = Text(
  'be beauty',
  style: TextStyle(
    fontFamily: 'Glitten',
    fontWeight: FontWeight.w500,
    fontSize: 36,
    color: kPrimaryColor,
  ),
);

const kAppNameTextPinksm = Text(
  'be beauty',
  style: TextStyle(
    fontFamily: 'Glitten',
    fontWeight: FontWeight.w500,
    fontSize: 24,
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

const kPop600TextStyle = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w700,
  fontSize: 18,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final kPasswordRegex = RegExp(
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$");
final kPhoneNumber =
    RegExp(r"^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$");
final kNameRegex = RegExp(r"^[a-zA-Z]+(([ ][a-zA-Z ])?[a-zA-Z]*)*$");

const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

const kDarkColor = Color(0xFF303030);
const kTransparent = Colors.transparent;
const kLightColor = Color(0xFF808080);
const kLessPadding = 10.0;
const kFixPadding = 16.0;
const kLess = 4.0;
const kAccentColor = Color(0xFFF1F1F1);
const kShape = 30.0;

const kDivider = Divider(
  color: kAccentColor,
  thickness: kLessPadding,
);

const kSmallDivider = Divider(
  color: kAccentColor,
  thickness: 5.0,
);

final reviewList = [
  ReviewModal(
    image: "assets/images/mensFashion.jpg",
    name: "John Travolta",
    rating: 3.5,
    date: "01 Jan 2021",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/girlsFashion.jpg",
    name: "Scarlett Johansson",
    rating: 2.5,
    date: "21 Feb 2021",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user1.jpg",
    name: "Jennifer Lawrence",
    rating: 4.5,
    date: "17 Mar 2021",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user11.jpg",
    name: "Michael Jordan",
    rating: 1.5,
    date: "12 Apr 2021",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  ),
  ReviewModal(
    image: "assets/images/user2.jpg",
    name: "Nicole Kidman",
    rating: 2.0,
    date: "28 May 2021",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user10.jpg",
    name: "James Franco",
    rating: 4.0,
    date: "14 Nov 2020",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user3.jpg",
    name: "Margot Robbie",
    rating: 1.0,
    date: "14 Nov 2020",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user9.jpg",
    name: "Nicolas Cage",
    rating: 3.0,
    date: "14 Nov 2020",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user4.jpg",
    name: "Emma Stone",
    rating: 5.0,
    date: "14 Nov 2020",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user8.jpg",
    name: "Johnny Depp",
    rating: 3.5,
    date: "14 Nov 2020",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user5.jpg",
    name: "Natalie Portman",
    rating: 3.5,
    date: "14 Nov 2020",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user7.jpg",
    name: "Anne Hathaway",
    rating: 3.5,
    date: "14 Nov 2020",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image: "assets/images/user6.jpg",
    name: "Charlize Theron",
    rating: 3.5,
    date: "14 Nov 2020",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
];
