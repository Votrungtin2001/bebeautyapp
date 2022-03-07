import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/ui/home/homes/cart/Product.dart';
import 'package:flutter/material.dart';

import 'package:bebeautyapp/constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final MProduct product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.engName,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            product.name,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n",
                         style: TextStyle(
                          color: kTextColor, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "${product.price}",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: kTextColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPadding),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.network(
                    product.images[0],
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
