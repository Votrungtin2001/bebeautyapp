import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/home/homes/cart/cart_screens.dart';
import 'package:bebeautyapp/ui/home/homes/search/search_screens.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/best_sell.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/categories.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/brand_card.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/new_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomeScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
          color: kTextColor,
        ),
        onPressed: () {showSearch(context: context, delegate: DataSearch());},
      ),
      title: kAppNameTextPinksm,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );},
        ),
        const SizedBox(width: kDefaultPadding / 2)
      ],
    ),
     drawer: Drawer(),
     body: SingleChildScrollView(
       child: Column(
         children: [
           ClipRRect(
             borderRadius: BorderRadius.circular(20.0),
             child: Container(
               padding: const EdgeInsets.all(20.0),
               height: MediaQuery.of(context).size.height / 3,
               child: Carousel(
                 images: [
                   NetworkImage(
                       'https://cf.shopee.vn/file/dac4992cd9609052f3c50ab4f7caa096_xxhdpi'),
                   NetworkImage(
                       'https://cf.shopee.vn/file/c64e8430deec41e474be2c15e128fb9b_xxhdpi'),
                   NetworkImage(
                       'https://cf.shopee.vn/file/9effbe0829a3f513afe65109b40d1aa1_xxhdpi')
                 ],
                 boxFit: BoxFit.fill,
                 showIndicator: false,
                 borderRadius: false,
                 moveIndicatorFromBottom: 180.0,
                 noRadiusForIndicator: true,
                 radius: Radius.circular(30.0),
               ),
             ),
           ),
           SizedBox(
             height: MediaQuery.of(context).size.height / 60,
           ),

           Categories(),
           SizedBox(
             height: MediaQuery.of(context).size.height / 50,
           ),
           BrandCard(),
           SizedBox(
             height: MediaQuery.of(context).size.height / 50,
           ),
           BestSell(),

           NewProduct(),
           SizedBox(
             height: MediaQuery.of(context).size.height / 50,
           ),

         ],
    ),
     ),
    );
  }
}