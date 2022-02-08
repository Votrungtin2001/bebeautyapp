import 'authentication_services.dart';

class SignUp_Controller {
  final AuthenticationServices _auth = AuthenticationServices();
  Future<bool> createUser(String email, String displayName, String phone, String password) async {
    dynamic result = await _auth.registerWithEmailAndPassword(
        email, phone, displayName, password);
    if (result != null) {
      print(result.toString());
      return true;
    }
    return false;
  }
}