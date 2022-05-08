
import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/repo/providers/product_provider.dart';
import 'package:bebeautyapp/repo/providers/user_provider.dart';
import 'package:bebeautyapp/repo/services/product_services.dart';
import 'package:bebeautyapp/ui/home/details/details_screen.dart';
import 'package:bebeautyapp/ui/home/homes/cart/Product.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/best_sell/best_sell_screens.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/product_card.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/recommend_product/recommend_product_screens.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/star_rating.dart';
import 'package:bebeautyapp/ui/home/product_details/product_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../section_title.dart';

class RecommendProduct extends StatelessWidget {
  late List<MProduct> products;
  RecommendProduct(List<MProduct> Products) {
    this.products = Products;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal:20),
          child: SectionTitle(title: "Recommend product", press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecommendProductScreen(),
                ));
          }),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                products.length,
                    (index) {
                    return Padding(
                        padding: EdgeInsets.only(left: 20),
                        child:
                        ProductCard(product: products[index],
                      press: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                          // builder: (context) => DetailsScreen(
                          //   product: products[index],
                          // ),
                          builder: (context) => DetailsScreen(product: products[index],

                          ),
                        ));
                      },
                        ),
                    );
                },
              ),
              SizedBox(width: 20),
            ],
          ),
        )
      ],
    );
  }
}



