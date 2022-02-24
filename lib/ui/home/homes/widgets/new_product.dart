import 'package:bebeautyapp/ui/home/details/details_screen.dart';
import 'package:bebeautyapp/ui/home/homes/cart/Product.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/best_sell.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/brand_card.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/categories.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewProduct extends StatelessWidget {
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
            spacing: 30, // gap between adjacent chips
            runSpacing: 15, // gap between lines
            direction: Axis.horizontal,
            children: List.generate(
              demoProducts.length,
                  (index) {
                if (demoProducts[index].isPopular)
                  return ProductCard(product: demoProducts[index],
                    // press: (){Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    //   builder: (context) => DetailsScreen(
                    //     product: demoProducts[index],
                    //   ),
                    // ));},
                  );
                return SizedBox
                    .shrink(); // here by default width and height is 0
              },
            ),
          ),
        ],
      ),
    );
  }
}