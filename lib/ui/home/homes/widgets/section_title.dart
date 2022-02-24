import 'package:bebeautyapp/constants.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: kTextColor,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            "See More",
            style: TextStyle(color: kTextLightColor),
          ),
        ),
      ],
    );
  }
}