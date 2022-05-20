import 'package:bebeautyapp/model/MProduct.dart';

import 'package:flutter/material.dart';

import 'package:bebeautyapp/constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final MProduct product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Text(
        product.chemicalComposition,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
