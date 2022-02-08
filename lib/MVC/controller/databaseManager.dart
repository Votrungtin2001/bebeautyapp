import 'package:bebeautyapp/MVC/model/MUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class DatabaseManager {
  final List<int> product_id = [];
  final CollectionReference Users = FirebaseFirestore.instance.collection('Users');
  final DatabaseReference refFavorite = FirebaseDatabase.instance.reference().child('Favorites');

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

  //Create Favorites Collection in Firebase Database
  Future<void> createFavorites(MUser user_model) async {
    return await refFavorite
        .child(user_model.id)
        .set({'user_id': user_model.id, 'product_id': product_id});
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

  // Create Chat Room Collection in FireStore
  Future<void> createChatRoom(chatRoomId) async {
    return await FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .set({'chatRoomID': chatRoomId,
      'latestMessage': "",
      'latestMessageTime': 0,
      'isSeenByAdmin': false,
      'latestMessageSendBy': ""})
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addMessage(chatRoomId, chatMessageData, message, time, isSeenByAdmin, idSender, isAdmin) async {

    FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .collection("Chat")
        .add(chatMessageData)
        .catchError((e){
      print(e.toString());
    });

    FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .update({'isSeenByAdmin': isSeenByAdmin,
      'latestMessage': message,
      'latestMessageTime': time,
      'latestMessageSendBy': idSender})
        .catchError((e){
      print(e.toString());
    });



  }

  seen(String chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .update({'isSeenByAdmin': true})
        .catchError((e){
      print(e.toString());
    });
  }

  getChats(String chatRoomId) async{
    return FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .collection("Chat")
        .orderBy('time')
        .snapshots();
  }

  Future<String> getFirstMesageUserID(String chatRoomId) async =>
      FirebaseFirestore.instance.collection("ChatRoom")
          .doc(chatRoomId)
          .collection("Chat")
          .orderBy('time')
          .get().then(((result) {
        String id = "";
        id = result.docs[0].get("sendBy");
        return id;
      }));

  getChatRooms() async {
    return FirebaseFirestore.instance
        .collection("ChatRoom")
        .orderBy('latestMessageTime', descending: true)
        .snapshots();
  }

  getUsers() async {
    return FirebaseFirestore.instance
        .collection("Users")
        .get();
  }

}