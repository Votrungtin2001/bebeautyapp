
import 'package:bebeautyapp/home_page.dart';
import 'package:bebeautyapp/ui/introduction_screen/introduction_screen.dart';
import 'package:bebeautyapp/model/user/MUser.dart';
import 'package:bebeautyapp/repo/providers/user_provider.dart';
import 'package:bebeautyapp/ui/home/homes/home.dart';
import 'package:bebeautyapp/ui/home/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MUser_IsNotLogout?>(context);

    final user_model = Provider.of<UserProvider>(context);

    if (user != null) {
      String user_id = "";
      if(user.uid != null) user_id = user.uid.toString();
      user_model.getUser(user_id);
      if(user.uid == "nI8SJUbcVcMOnG8bcyk0B5FAzX12") return HomePage();
      else return HomePage() ;
    }
    else return IntroductionScreen();


  }
}