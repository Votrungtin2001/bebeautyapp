import 'package:flutter/material.dart';
import 'package:bebeautyapp/ui/authenication/login/widgets/text_field_container.dart';
import 'package:bebeautyapp/contants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        focusNode: focusNode ?? FocusNode(),
        onChanged: onChanged,
        cursorColor: kTextColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}