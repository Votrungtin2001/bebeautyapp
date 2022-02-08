import 'package:bebeautyapp/ui/authenication/login/widgets/rounded_input_field.dart';
import 'package:bebeautyapp/ui/authenication/register/widgets/custom_rounded_loading_button.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:bebeautyapp/model/login/login_view_model.dart';
import 'package:bebeautyapp/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';


class ForgotPasswordScreen extends StatelessWidget {
  static String id = "ForgotPasswordScreen";
  final sendEmailButtonController = RoundedLoadingButtonController();
  final emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFE3E3),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              "assets/images/forgot_password.svg",
              height: 352,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Forgot password?",
              style: kBigTitleTextStyle.copyWith(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50,right: 50),
              child: Text(
                "Don’t worry! It happens. Please enter the email address associated with your account.",
                style: kPop400TextStyle,
                textAlign: TextAlign.center,
              ),
              ),

            SizedBox(
              height: 26,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 50,right: 50),
              child: RoundedInputField(
                hintText: "Email",
                icon: Icons.mail_outline_outlined,
                focusNode: emailFocusNode,
                onChanged: (value) {},
              ),
            ),

            CustomRoundedLoadingButton(
              text: 'Send',
              onPress: () {
                //login click
                // Provider.of<LoginViewModel>(context, listen: false)
                //     .loginWithEmailAndPassword((message) {
                //   if (message != null) {
                //     CoolAlert.show(
                //         context: context,
                //         type: CoolAlertType.error,
                //         text: 'Sign in failed!\nError: $message',
                //         onConfirmBtnTap: () {
                //           loginButtonController.reset();
                //           Navigator.of(context).pop();
                //         });
                //   } else {
                //     loginButtonController.success();
                //   }
                // });
              },
              controller: sendEmailButtonController,
              horizontalPadding: 45,
            ),
          ],
        ),
      ),
    );
  }
}
