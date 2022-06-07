import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/repo/providers/brand_provider.dart';
import 'package:bebeautyapp/repo/providers/category_provider.dart';
import 'package:bebeautyapp/repo/providers/product_provider.dart';
import 'package:bebeautyapp/repo/providers/user_provider.dart';
import 'package:bebeautyapp/repo/services/product_services.dart';
import 'package:bebeautyapp/ui/home/cart/cart_screens.dart';
import 'package:bebeautyapp/ui/home/details/details_screen.dart';

import 'package:bebeautyapp/ui/home/homes/search/search_screens.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/brand/brand_card.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/brand/details_brand.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/category/categories.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/item_card.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FavoriteListScreens extends StatelessWidget {
  final productServices = new ProductServices();
  List<MProduct> favoriteProducts = [];
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    final productProvider = Provider.of<ProductProvider>(context);

    if (productProvider.products.length > 10) {
      if (userProvider.user.id != "") {
        favoriteProducts = productServices.getFavoriteProducts(
            productProvider.products, userProvider.user);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Favourite List"),
        titleTextStyle: TextStyle(
            color: kPrimaryColor,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: BackButton(
          color: kPrimaryColor,
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              // By default our  icon color is white
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
          const SizedBox(width: kDefaultPadding / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Text(
                      favoriteProducts.length.toString() + " product",
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                        color: kTextLightColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 150,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: GridView.builder(
                        itemCount: favoriteProducts.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: kDefaultPadding,
                          crossAxisSpacing: kDefaultPadding,
                          childAspectRatio: 0.5,
                        ),
                        itemBuilder: (context, index) => ProductCard(
                          rating: true,
                          product: favoriteProducts[index],
                          press: () async {
                            List<MProduct> similarProductsFromSelectedProducts =
                                await productServices
                                    .getSimilarityProductsBySelectedProduct(
                                        productProvider.products,
                                        favoriteProducts[index]);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // builder: (context) => DetailsScreen(
                                  //   product: products[index],
                                  // ),
                                  builder: (context) => DetailsScreen(
                                    product: productServices
                                        .getTop10BestSellerProduct(
                                            productProvider.products)[index],
                                    similarProductsFromSelectedProducts:
                                        similarProductsFromSelectedProducts,
                                  ),
                                ));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
