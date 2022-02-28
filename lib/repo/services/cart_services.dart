import 'package:bebeautyapp/model/MProductsInCart.dart';
import 'package:bebeautyapp/model/user/MUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartServices {
  final List<MProductsInCart> products = [];
  final CollectionReference refCart = FirebaseFirestore.instance.collection('Cart');

  //Create Cart Collection in Firebase Database
  Future<void> createCart(MUser user_model) async {
    return await refCart
        .doc(user_model.id)
        .set({'user_id': user_model.id,
              'products': products,
    });
  }

}