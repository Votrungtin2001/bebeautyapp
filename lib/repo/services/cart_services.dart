import 'package:bebeautyapp/model/MProductsInCart.dart';
import 'package:bebeautyapp/model/user/MUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/MCart.dart';
import '../../model/MProduct.dart';
import '../../model/MProductInCart.dart';

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

  //Add Product in Cart
  void addProductInCart(MCart cart, MProduct product, int quantity) {
    MProductInCart productInCart = new MProductInCart(id: product.id, name: product.name, engName: product.engName, displayImage: product.getImage(0), quantity: quantity, price: product.price);
    cart.addProductInCart(productInCart);
  }

  //Calculate the total value of selected products in Cart
  double totalValueOfSelectedProductsInCart(List<MProductInCart> selectedProducts) {
    MCart cart = new MCart(products: selectedProducts);
    return cart.getTotalPrice();
  }

  //Calculate the total quantity of selected products in Cart
  int totalQuantityOfSelectedProductsInCart(List<MProductInCart> selectedProducts) {
    MCart cart = new MCart(products: selectedProducts);
    return cart.getTotalQuantity();
  }

  //Remove products in Cart
  void removeSelectedProductsInCart(List<MProductInCart> products, List<MProductInCart> selectedProducts) {
    for(int i = 0; i < selectedProducts.length; i++) {
      for(int j = 0; j < products.length; j++) {
        if(selectedProducts[i].getID() == products[j].getID()) products.removeAt(j);
      }
    }
  }

  //Calculate shipping value
  double calculateShippingValue(double totalDistance) {
    if(totalDistance > 0 && totalDistance < 2) {
      return 0;
    }
    else if(totalDistance >= 2 && totalDistance < 10) {
      return 30000;
    }
    else if(totalDistance >= 10 && totalDistance < 25) {
    return 30000;
    }
    else if(totalDistance >= 25 && totalDistance < 50) {
      return 60000;
    }
    else if(totalDistance >= 50) {
      return 100000;
    }
    else return 0;
  }

}