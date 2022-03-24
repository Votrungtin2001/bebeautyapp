import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/ui/home/homes/cart/Product.dart';
import 'package:flutter/material.dart';

import 'package:bebeautyapp/constants.dart';

class Ingredent extends StatelessWidget {
  const Ingredent({
    Key? key,
    required this.product,
  }) : super(key: key);

  final MProduct product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
        product.guideLine,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}