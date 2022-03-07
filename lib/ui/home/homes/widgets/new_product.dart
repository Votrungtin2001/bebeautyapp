import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/ui/home/details/details_screen.dart';
import 'package:bebeautyapp/ui/home/homes/cart/Product.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/best_sell.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/brand/brand_card.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/category/categories.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewProduct extends StatelessWidget {
  late List<MProduct> products;
  NewProduct(List<MProduct> Products) {
    this.products = Products;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SectionTitle(
            title: "New product",
            press: () {},
          ),
          SizedBox(height: 20,),
          Wrap(
            spacing: 10, // gap between adjacent chips
            runSpacing: 25, // gap between lines
            direction: Axis.horizontal,
            children: List.generate(
              products.length,
                  (index) {
                  return Padding(
                      padding: EdgeInsets.only(left: 20),
                      child:  ProductCard(product: products[index],
                    press: (){Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: products[index],
                      ),
                    ));},
                      ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}