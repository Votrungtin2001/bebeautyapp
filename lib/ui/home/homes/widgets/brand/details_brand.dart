import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/model/MBrand.dart';
import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/repo/providers/brand_provider.dart';
import 'package:bebeautyapp/repo/providers/category_provider.dart';
import 'package:bebeautyapp/repo/providers/product_provider.dart';
import 'package:bebeautyapp/repo/services/product_services.dart';
import 'package:bebeautyapp/ui/home/details/details_screen.dart';
import 'package:bebeautyapp/ui/home/homes/cart/cart_screens.dart';
import 'package:bebeautyapp/ui/home/homes/search/search_screens.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/best_sell/best_sell.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/category/categories.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/item_card.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DetailsBrand extends StatelessWidget {
  final MBrand brand;

  const DetailsBrand({Key? key, required this.brand}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    final productServices = new ProductServices();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              // By default our  icon color is white
              color: kTextColor,
            ),
            onPressed: () {showSearch(context: context, delegate: DataSearch());},
          ),
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
          SizedBox(width: kDefaultPadding / 2)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              brand.name,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 15,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height-153,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: GridView.builder(
                          itemCount: productServices.getTop10BestSellerProduct(productProvider.products).length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: kDefaultPadding,
                            crossAxisSpacing: kDefaultPadding,
                            childAspectRatio: 0.5,
                          ),
                          itemBuilder: (context, index) => ProductCard(product: productServices.getTop10BestSellerProduct(productProvider.products)[index],
                            press: (){Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // builder: (context) => DetailsScreen(
                                  //   product: products[index],
                                  // ),
                                  builder: (context) => DetailsScreen(product: productServices.getTop10BestSellerProduct(productProvider.products)[index],

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

          // SizedBox(
          //   height: MediaQuery.of(context).size.height,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          //     child: GridView.builder(
          //       itemCount: brandProvider.brands.length,
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2,
          //         mainAxisSpacing: kDefaultPadding,
          //         crossAxisSpacing: kDefaultPadding,
          //         childAspectRatio: 1.15,
          //       ),
          //       itemBuilder: (context, index) => ProductCard(
          //         product: brandProvider.brands[index].,
          //
          //         press: (){Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => DetailsBrand(
          //                 brand: brandProvider.brands[index],
          //               ),
          //             ));},
          //       ),
          //     ),
          //   ),
          //
          // ),
          ),
        ],
      ),
    );
  }
}