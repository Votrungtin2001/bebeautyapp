import 'package:flutter/material.dart';
import 'package:bebeautyapp/ui/authenication/login/widgets/text_field_container.dart';
import 'package:bebeautyapp/contants.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        focusNode: focusNode ?? FocusNode(),
        cursorColor: kTextColor,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.lock,
            color: Colors.black,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.black,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}