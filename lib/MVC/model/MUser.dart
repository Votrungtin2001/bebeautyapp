import 'package:cloud_firestore/cloud_firestore.dart';

class MUser {
  late String id;
  late String displayName;
  late String email;
  late int role;
  late String address;
  late String phone;
  late DateTime dob;
  late int gender;
  late String avatarUri;

  MUser(
      {required this.id,
        required this.displayName,
        required this.email,
        required this.role,
        required this.address,
        required this.phone,
        required this.dob,
        required this.gender,
        required this.avatarUri});

  static MUser copyFrom(MUser user) {
    return MUser(
      id: user.id,
      displayName: user.displayName,
      email: user.email,
      role: user.role,
      address: user.address,
      phone: user.phone,
      dob: user.dob,
      gender: user.gender,
      avatarUri: user.avatarUri,
    );
  }

  String getID() {return this.id;}
  void setID(String ID) {this.id = ID;}

  String getEmail() {return this.email;}
  void setEmail(String Email) {this.email = Email;}

  String getName() {return this.displayName;}
  void setName(String Name) {this.displayName = displayName;}

  int getRole() {return this.role;}
  void setRole(int Role) {this.role = Role;}

  String getPhoto() {return this.avatarUri;}
  void setPhoto(String newAvatarUri) {this.avatarUri = newAvatarUri;}

  String getAddress() {return this.address;}
  void setAddress(String Address) {this.address = Address;}

  String getPhone() {return this.phone;}
  void setPhone(String Phone) {this.phone = Phone;}

  DateTime getDob() {return this.dob;}
  void setDob(DateTime Dob) {this.dob = Dob;}

  int getGender() {return this.gender;}
  void setGender(int Gender) {this.gender = Gender;}

  MUser.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.get('id');
    displayName = snapshot.get('displayName');
    email = snapshot.get('email');
    role = snapshot.get('role');
    address = snapshot.get('address');
    phone = snapshot.get('phone');
    dob = snapshot.get('dob');
    gender = snapshot.get('gender');
    avatarUri = snapshot.get('avatarUri');
  }

}

class MUser_IsNotLogout {

  final String? uid;

  MUser_IsNotLogout({this.uid});

}

