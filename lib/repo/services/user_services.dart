import 'package:bebeautyapp/model/MAddress.dart';
import 'package:bebeautyapp/model/MPreference.dart';
import 'package:bebeautyapp/model/user/MUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserServices {
  final CollectionReference userRef = FirebaseFirestore.instance.collection('Users');
  String defaultAvatarUri = "https://firebasestorage.googleapis.com/v0/b/be-beauty-app.appspot.com/o/avatar.jpg?alt=media&token=4cb911b2-3282-4aea-b03a-0ab9b681602a";

  //Create User Collection in FireStore
  Future<void> createBeBeautyUser(MUser user_model) async {
    return await userRef
        .doc(user_model.id)
        .set({
      'id': user_model.id,
      'displayName': user_model.displayName,
      'email': user_model.email,
      'phone': user_model.phone,
      'dob': user_model.dob,
      'gender': user_model.gender,
      'point': user_model.point,
      'totalSpending': user_model.totalSpending,
      'role': user_model.role,
      'avatarUri': user_model.avatarUri}
    );
  }

  //Get User
  Future<MUser> getUser(String userID) async {
    MUser user = new MUser(id: "",
        displayName: "",
        email: "",
        phone: "",
        dob: DateTime(2001, 1, 1),
        gender: 1,
        address: new MAddress(userID: "",fullStreetName: "", latitude: 0, longitude: 0),
        point: 0,
        totalSpending: 0,
        role: 1,
        avatarUri: "https://firebasestorage.googleapis.com/v0/b/be-beauty-app.appspot.com/o/avatar.jpg?alt=media&token=4cb911b2-3282-4aea-b03a-0ab9b681602a",
        preference: new MPreference(userID: "", brandHistory: [], skinTypeHistory: [], categoryHistory: [], sessionHistory: [], structureHistory: []));

    await userRef.where('id', isEqualTo: userID).get().then((result) {
      for (DocumentSnapshot User in result.docs) {
        user = MUser.fromSnapshot(User);
      }
    });
    return user;

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