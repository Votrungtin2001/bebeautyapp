import 'dart:convert';

import 'package:bebeautyapp/model/MData.dart';
import 'package:bebeautyapp/model/MDataCBR.dart';
import 'package:bebeautyapp/model/MDataCFR.dart';
import 'package:bebeautyapp/model/MHistory.dart';
import 'package:bebeautyapp/model/MPreference.dart';
import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/model/user/MUser.dart';
import 'package:bebeautyapp/repo/services/user_services.dart';
import 'package:bebeautyapp/variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../model/MProductInCart.dart';

class ProductServices {
  final CollectionReference refProduct= FirebaseFirestore.instance.collection('Product');
  UserServices userServices = UserServices();

  Future<List<MProduct>> getProducts() async =>
      await refProduct.orderBy('id', descending: false).get().then((result) {
        List<MProduct> products = [];
        for (DocumentSnapshot Product in result.docs) {
          products.add(MProduct.fromSnapshot(Product));
        }
        return products;
      });

  Future<int> getAvailableByProductID(int productID) async =>
      await refProduct.doc(productID.toString()).get().then((result) {
        if(result.exists == true) return result.get('available');
        return -1;
      });

  Future<bool> updateAvailableByProductID(int productID, int quantity) async {
    int available = await getAvailableByProductID(productID);
    if(available == -1) return false;
    else if(available - quantity < 0) {
      Fluttertoast.showToast(msg: 'Some products were out of stock.', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
      return false;
    }
    else {
      int now_available = available - quantity;
      await refProduct.doc(productID.toString()).update({'available': now_available});
      return true;
    }
  }

  Future<bool> checkUpdateAvailableByProductID(List<MProductInCart> products) async {
    int iCount = 0;
    for(int i = 0; i < products.length; i++) {
      bool result = await updateAvailableByProductID(products[i].getID(), products[i].getQuantity());
      if(result == true) iCount++;
    }
    if(iCount == products.length) return true;
    else return false;
  }


  List<MProduct> getTop10NewProducts(List<MProduct> products) {
    List<MProduct> top10 = [];
    for(int i = products.length - 1; i > 0; i--) {
      top10.add(products[i]);
      if(top10.length == 10) break;
    }
    return top10;
  }
//Insertion Sort
  List<MProduct> orderProductsWithDesc(List<MProduct> products) {
    int i, j;
    MProduct product;
    for (i = 1; i < products.length; i++)
    {
      product = products[i];
      j = i-1;

      /* Di chuyển các phần tử có giá trị lớn hơn giá trị
       key về sau một vị trí so với vị trí ban đầu
       của nó */
      while (j >= 0 && products[j].getSoldOut() < product.getSoldOut())
      {
        products[j+1] = products[j];
        j = j-1;
      }
      products[j+1] = product;
    }
    return products;
  }

  List<MProduct> getTop10BestSellerProduct(List<MProduct> products) {
    List<MProduct> top10 = [];
    List<MProduct> temp = [];
    for(int i = 0; i < products.length; i++) {
      temp.add(products[i]);
    }
    orderProductsWithDesc(temp);
    for (int i = 0; i < temp.length; i++) {
      top10.add(temp[i]);
      if(top10.length == 10) break;
    }
    return top10;
  }
  
  Future<List<String>> getUserFavoriteList(int productID) async {
    List<String> users = [];
    await refProduct.doc(productID.toString()).get().then((result) {
      users = List.from(result.get('userFavorite'));

    });
    return users;
  }

  Future<bool> updateFavorite(int productID, String userID) async {
    List<String> users = await getUserFavoriteList(productID);
    if(!users.contains(userID)) {
      print("add favorite successfully");
      await refProduct.doc(productID.toString()).update({
        'userFavorite': FieldValue.arrayUnion([userID]),
      });
      return true;
    }
    else {
      print("remove favorite successfully");
      await refProduct.doc(productID.toString()).update({
        'userFavorite': FieldValue.arrayRemove([userID]),
      });
      return false;
    }

  }

  bool checkFavorite(String userID, List<String> userFavorite) {
    if(userFavorite.contains(userID)) return true;
    return false;
  }

  int getProductIndexWithID(List<MProduct> products, int productID) {
    for(int i = 0; i < products.length; i++) {
      if(products[i].getID() == productID) return i;
    }
    return -1;
  }

  MProduct getProductByID(List<MProduct> products, int productID) {
    MProduct product = new MProduct(id: 0, name: "", engName: "",
        brandID: 0, categoryID: 0, originID: 0, skinID: 0, sessionID: 0,
        genderID: 0, structureID: 0, soldOut: 0, totalStarRating: 0, totalRating: 0,
        marketPrice: 0, importPrice: 0, defaultDiscountRate: 0, price: 0,
        chemicalComposition: "", guideLine: "", images: [], userFavorite: [],
        available: 0, searchCount: 0, popularSearchTitle: "", description: "");

    for(int i = 0; i < products.length; i++) {
      if(products[i].getID() == productID) return products[i];
    }
    return product;
  }

  //Get Product
  Future<MProduct> getProductForRealTime(MProduct product) async {
    List<MProduct> products = [];
    await refProduct.where('id', isEqualTo: product.getID()).get().then((result) {
      for (DocumentSnapshot Product in result.docs) {
        MProduct temp = MProduct.fromSnapshot(Product);
        products.add(temp);
      }
    });

    if(product.available != products[0].available) {
      print('here');
      print(products[0].available);
      return products[0];
    }
    else return product;

  }

  Future<List<MProduct>> getSimilarityProductsByCBR(List<MProduct> products, MUser User) async {
    List<MProduct> results = [];

    MUser user = userServices.checkAndReturnUser(User, products);

    MDataCBR Data = new MDataCBR(products: products, user: user);
    http.Response response =  await http.post(
      Uri.https(Variable.url, '/api/getSimilarProductsBasedUserByCBR'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(Data),
    );
    var data = await json.decode(response.body);
    for(int i = 0; i < data['result'].length; i++) {
      int id = data['result'][i]['id'];
      results.add(getProductByID(products, id));
    }
    return results;
  }

  Future<List<MProduct>> getSimilarityProductsByCFR(List<MProduct> products, MUser User) async {
    List<MProduct> results = [];
    List<MUser> Users = await userServices.getUsers();

    List<MUser> users = userServices.checkAndReturnUsers(Users, User, products);
    MUser user = userServices.checkAndReturnUser(User, products);

    MDataCFR Data = new MDataCFR(products: products, users: users, user: user);
    http.Response response =  await http.post(
      Uri.https(Variable.url, '/api/getSimilarProductsByCFR'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(Data),
    );
    var data = await json.decode(response.body);
    for(int i = 0; i < data['result'].length; i++) {
      int id = data['result'][i]['id'];
      results.add(getProductByID(products, id));
    }
    return results;
  }

  Future<List<MProduct>> getSimilarityProductsBySelectedProduct(List<MProduct> products, MProduct product) async {
    List<MProduct> results = [];
    List<MProduct> temp = [];

    for(int i = 0; i < products.length; i++) {
      if(products[i].getID() != product.getID()) temp.add(products[i]);
    }

    MData Data = new MData(products: temp, product: product);
    http.Response response =  await http.post(
      Uri.https(Variable.url, '/api/getSimilarProductBySelectedProduct'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(Data),
    );
    var data = await json.decode(response.body);
    for(int i = 0; i < data['result'].length; i++) {
      int id = data['result'][i]['id'];
      if(id != product.getID()) results.add(getProductByID(products, id));
    }
    return results;
  }

  List<MProduct> get10RecommendedProducts(List<MProduct> products) {
    List<MProduct> result = [];
    for (int i = 0; i < products.length; i++) {
      if(result.length == 10) return result;
      result.add(products[i]);
    }
    return result;
  }

  List<MProduct> getProductsFromSameBrand(List<MProduct> products, MProduct product) {
    List<MProduct> result = [];
    for (int i = 0; i < products.length; i++) {
      if(product.brandID == products[i].brandID && product.id != products[i].id) result.add(products[i]);
    }
    return result;
  }

  List<MProduct> getAllProductsFromBrand(List<MProduct> products, int brandID) {
    List<MProduct> result = [];
    for (int i = 0; i < products.length; i++) {
      if(brandID == products[i].brandID) result.add(products[i]);
    }
    return result;
  }

  List<MProduct> getAllProductsFromCategory(List<MProduct> products, int categoryID) {
    List<MProduct> result = [];
    for (int i = 0; i < products.length; i++) {
      if(categoryID == products[i].categoryID) result.add(products[i]);
    }
    return result;
  }

  List<MProduct> getFavoriteProducts(List<MProduct> products, MUser user) {
    List<MProduct> result = [];
    for (int i = 0; i < products.length; i++) {
      for(int j = 0; j < products[i].userFavorite.length; j++) {
        if(products[i].userFavorite[j] == user.getID()) result.add(products[i]);
      }
    }
    return result;
  }



}