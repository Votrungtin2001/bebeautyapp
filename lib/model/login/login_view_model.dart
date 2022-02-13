import 'package:bebeautyapp/repo/bebeauty_repo.dart';
import 'package:bebeautyapp/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginViewModel extends ChangeNotifier {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isLoading = false;

  set isLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  void reset() {
    _isLoading = false;
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void loginWithEmailAndPassword(void Function(String) onComplete) async {
    isLoading = true;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String result;

    if (!(emailValidatorRegExp.hasMatch(email) && kPasswordRegex.hasMatch(password)))
      result = 'Incorrect email or password!';
    else
      result = await BeBeautyRepo.signInWithEmailAndPassword(email, password);
    onComplete(result);
    reset();
    isLoading = false;
  }

  String passwordValidator(text) {
    if (!kPasswordRegex.hasMatch(text)) return 'Invalid password!';
    return "Valid Password";
  }

  String emailValidator(text) {
    if (!emailValidatorRegExp.hasMatch(text)) return 'Invalid email!';
    return "Valid Password";
  }

  Future onGoogleLoginClick() async {
    isLoading = true;
    BeBeautyRepo.handleGoogleSignIn();
    isLoading = false;
  }

  Future onFacebookSignInClick() async {
    isLoading = true;

    BeBeautyRepo.handleFacebookSignIn();
    isLoading = false;
  }

  void onResetPasswordClick(void Function(String) onComplete) async {
    if (emailController.text.isEmpty) {
      onComplete("Please enter email!");
      return;
    } else if (!emailValidatorRegExp.hasMatch(emailController.text)) {
      onComplete("Invalid email!");
      return;
    }
    String? res = await BeBeautyRepo.sendResetPasswordEmail(emailController.text);
    onComplete(res!);
  }
}
