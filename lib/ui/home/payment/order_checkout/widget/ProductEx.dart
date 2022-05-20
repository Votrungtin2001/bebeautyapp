import 'package:flutter/material.dart';

class ProductEx {
  final int id;
  final int numOfItems;
  final String images;
  final String name, phoneNumber, address;
  final List<ProductTemp> productTemp;
  final double price, delivery, total;
  final String time;

  ProductEx({
    required this.productTemp,
    required this.id,
    required this.images,
    required this.price,
    required this.numOfItems,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.delivery,
    required this.time,
    required this.total,
  });
}

class ProductTemp {
  final String nameProduct;
  final String imgProduct;
  final int numProduct;

  ProductTemp({
    required this.nameProduct,
    required this.imgProduct,
    required this.numProduct,
  });
}

// Our demo Products

List<ProductTemp> demoProductsTemp1 = [
  ProductTemp(
    nameProduct:
        '3Ten san pham dai long thong long thong san pham dai long thong long thong san pham dai long thong long thong',
    numProduct: 1,
    imgProduct: 'assets/images/product3.png',
  ),
  ProductTemp(
    nameProduct:
        '2Ten san pham dai long thong long thong san pham dai long thong long thong san pham dai long thong long thong',
    numProduct: 2,
    imgProduct: 'assets/images/product2.png',
  ),
  ProductTemp(
    nameProduct:
        '1Ten san pham dai long thong long thong san pham dai long thong long thong san pham dai long thong long thong',
    numProduct: 3,
    imgProduct: 'assets/images/product1.png',
  ),
];

List<ProductTemp> demoProductsTemp0 = [
  ProductTemp(
    nameProduct:
        '3Ten san pham dai long thong long thong san pham dai long thong long thong san pham dai long thong long thong',
    numProduct: 1,
    imgProduct: 'assets/images/product3.png',
  ),
];

ProductEx demoProducts1 = ProductEx(
    address:
        '120 XL Hà Nội, Thành Phố, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam',
    delivery: 11000,
    name: 'Bui Thanh Phu',
    productTemp: demoProductsTemp0,
    numOfItems: demoProductsTemp0.length,
    phoneNumber: '0932112345678',
    total: 1000,
    id: 131231,
    time: 'Wed, 12 September',
    images: 'assets/images/product3.png',
    price: 1000);

ProductEx demoProducts2 = ProductEx(
    address:
        '120 XL Hà Nội, Thành Phố, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam',
    delivery: 1000,
    name: 'Bui Thanh Phu',
    productTemp: demoProductsTemp1,
    numOfItems: demoProductsTemp1.length,
    phoneNumber: '0932112345678',
    total: 1000,
    id: 2222,
    time: 'Wed, 12 September',
    images: 'assets/images/product3.png',
    price: 1000);

List<ProductEx> demoProduct = [
  ProductEx(
      address:
          '120 XL Hà Nội, Thành Phố, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam',
      delivery: 11000,
      name: 'Bui Thanh Phu',
      productTemp: demoProductsTemp0,
      numOfItems: demoProductsTemp0.length,
      phoneNumber: '0932112345678',
      total: 1000,
      id: 131231,
      time: 'Wed, 12 September',
      images: 'assets/images/product3.png',
      price: 1000),
  ProductEx(
      address:
          '120 XL Hà Nội, Thành Phố, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam',
      delivery: 1000,
      name: 'Bui Thanh Phu',
      productTemp: demoProductsTemp1,
      numOfItems: demoProductsTemp1.length,
      phoneNumber: '0932112345678',
      total: 1000,
      time: 'Wed, 12 September',
      id: 2222,
      images: 'assets/images/product3.png',
      price: 1000),
  ProductEx(
      address:
          '120 XL Hà Nội, Thành Phố, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam',
      delivery: 1000,
      name: 'Bui Thanh Phu',
      productTemp: demoProductsTemp1,
      numOfItems: demoProductsTemp1.length,
      phoneNumber: '0932112345678',
      total: 1000,
      id: 2222,
      time: 'Wed, 12 September',
      images: 'assets/images/product3.png',
      price: 1000),
];
