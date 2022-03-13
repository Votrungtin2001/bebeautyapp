import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/ui/home/homes/cart/Product.dart';
import 'package:bebeautyapp/ui/home/homes/cart/cart_screens.dart';
import 'package:bebeautyapp/ui/home/homes/search/search_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/home/details/widgets/body.dart';

class DetailsScreen extends StatelessWidget {
  final MProduct product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      drawer: Drawer(),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {showSearch(context: context, delegate: DataSearch());},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );},
        ),
        SizedBox(width: kDefaultPadding / 2)
      ],
    );

  }
}