import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/model/user/MUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductServices {
  final CollectionReference refProduct= FirebaseFirestore.instance.collection('Product');

  Future<List<MProduct>> getProducts() async =>
      refProduct.orderBy('id', descending: false).get().then((result) {
        List<MProduct> products = [];
        for (DocumentSnapshot Product in result.docs) {
          products.add(MProduct.fromSnapshot(Product));
        }
        return products;
      });

  List<MProduct> getTop10NewProducts(List<MProduct> products) {
    List<MProduct> top10 = [];
    for(int i = products.length - 10; i < products.length; i++) {
      top10.add(products[i]);
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
    List<MProduct> temp = products;
    orderProductsWithDesc(temp);
    for (int i = 0; i < 10; i++) {
      top10.add(temp[i]);
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
}