import 'package:bebeautyapp/model/user/MUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  final CollectionReference Users = FirebaseFirestore.instance.collection('Users');
  String defaultAvatarUri = "https://firebasestorage.googleapis.com/v0/b/be-beauty-app.appspot.com/o/avatar.jpg?alt=media&token=4cb911b2-3282-4aea-b03a-0ab9b681602a";

  //Create User Collection in FireStore
  Future<void> createBeBeautyUser(MUser user_model) async {
    return await Users
        .doc(user_model.id)
        .set({'id': user_model.id,
      'displayName': user_model.displayName,
      'email': user_model.email,
      'role': user_model.role,
      'address': user_model.address,
      'phone': user_model.phone,
      'dob': user_model.dob,
      'gender': user_model.gender,
      'photo': defaultAvatarUri}
    );
  }

  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection("Users")
        .where('name', isEqualTo: searchField)
        .get();
  }

  searchUserByID(String id) {
    return FirebaseFirestore.instance
        .collection("Users")
        .where('id', isEqualTo: id)
        .get();
  }

  getUsers() async {
    return FirebaseFirestore.instance
        .collection("Users")
        .get();
  }

}