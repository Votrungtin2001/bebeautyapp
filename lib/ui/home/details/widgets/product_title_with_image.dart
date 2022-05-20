import 'package:bebeautyapp/model/MProduct.dart';

import 'package:carousel_pro/carousel_pro.dart';
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
    int currentIndex = 0;
    PageController pageController = PageController(initialPage: 0);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: 400,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: product.images.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      product.images[index],
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 16.0,
                left: 0.0,
                right: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    product.images.length,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      height: 8.0,
                      width: currentIndex == index ? 24.0 : 8.0,
                      margin: EdgeInsets.only(right: 4.0),
                      decoration: BoxDecoration(
                        color:
                            currentIndex == index ? kPrimaryColor : kLightColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Expanded(
          //   child: Hero(
          //     tag: "${product.id}",
          //     child: Image.network(
          //       product.images[0],
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
