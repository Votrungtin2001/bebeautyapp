import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/model/user/MUser.dart';
import 'package:bebeautyapp/repo/services/product_services.dart';
import 'package:flutter/material.dart';


class ProductProvider with ChangeNotifier {
  ProductServices productServices = ProductServices();
  List<MProduct> products = [];

  List<MProduct> similarProductsBasedUserByCBR = [];
  bool isNeededUpdated_SimilarProductsBasedUserByCBR = false;

  List<MProduct> similarProductsByCFR = [];
  bool isNeededUpdated_SimilarProductsByCFR = false;

  List<MProduct> similarProductsBySelectedProduct = [];
  bool isNeededUpdated_SimilarProductsBySelectedProduct = false;

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

  Future<void> updateSimilarProductsBasedUserByCBR(List<MProduct> products, MUser user) async {
    if(isNeededUpdated_SimilarProductsBasedUserByCBR == true) {
      similarProductsBasedUserByCBR = await productServices.getSimilarityProductsByCBR(products, user);
      isNeededUpdated_SimilarProductsBasedUserByCBR = false;
      for (int i = 0; i < similarProductsBasedUserByCBR.length; i++) {
        print(similarProductsBasedUserByCBR[i].name);
      }
      notifyListeners();
    }
  }

  Future<void> updateSimilarProductsByCFR(List<MProduct> products, MUser user) async {
    if(isNeededUpdated_SimilarProductsByCFR == true) {
      similarProductsByCFR = await productServices.getSimilarityProductsByCFR(products, user);
      isNeededUpdated_SimilarProductsByCFR = false;
      notifyListeners();
    }
  }

  Future<void> updateSimilarProductsBySelectedProduct(List<MProduct> products, MProduct product) async {
    if(isNeededUpdated_SimilarProductsBySelectedProduct == true) {
      similarProductsBySelectedProduct = await productServices.getSimilarityProductsBySelectedProduct(products, product);
      isNeededUpdated_SimilarProductsBySelectedProduct = false;
      notifyListeners();
    }
  }
}