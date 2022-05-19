import 'package:flutter/material.dart';

class Address {
  String name, phoneNumber, address;
  bool addressDefault;

  Address(
      {required this.name,
      required this.phoneNumber,
      required this.address,
      required this.addressDefault});
}

// Demo data for our Address

List<Address> demoAddress = [
  Address(
      name: 'Bui Thanh Phu',
      phoneNumber: '09321061231',
      address: '1123 akdshn, sdakjda, dansdasn,asdas',
      addressDefault: true),
  Address(
      name: 'Vo Trung Tin',
      phoneNumber: '0213219912',
      address: '129 dasmldas, damdas,d sadsa',
      addressDefault: false),
];
