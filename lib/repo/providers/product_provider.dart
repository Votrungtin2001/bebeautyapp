import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/repo/services/product_services.dart';
import 'package:flutter/material.dart';


class ProductProvider with ChangeNotifier {
  ProductServices productServices = ProductServices();
  List<MProduct> products = [];

  ProductProvider.initialize(){
    loadProducts();
  }

  loadProducts() async {
    products = await productServices.getProducts();
    notifyListeners();
  }

  void updateUserFavorite(String userID, int productID) {
    int index = productServices.getProductIndexWithID(products, productID);
    if(!products[index].getUserFavorite().contains(userID)) {
      products[index].getUserFavorite().add(userID);
    }
    else products[index].getUserFavorite().remove(userID);
    notifyListeners();
  }
}