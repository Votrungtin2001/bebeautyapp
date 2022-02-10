import 'package:bebeautyapp/model/user/MUser.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductServices {
  final List<int> product_id = [];
  final DatabaseReference refFavorite = FirebaseDatabase.instance.reference().child('Favorites');

  //Create Favorites Collection in Firebase Database
  Future<void> createFavorites(MUser user_model) async {
    return await refFavorite
        .child(user_model.id)
        .set({'user_id': user_model.id, 'product_id': product_id});
  }

}