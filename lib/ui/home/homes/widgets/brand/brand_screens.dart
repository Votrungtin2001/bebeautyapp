import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/repo/providers/brand_provider.dart';
import 'package:bebeautyapp/repo/providers/category_provider.dart';
import 'package:bebeautyapp/repo/providers/product_provider.dart';
import 'package:bebeautyapp/repo/services/product_services.dart';
import 'package:bebeautyapp/ui/home/details/details_screen.dart';
import 'package:bebeautyapp/ui/home/cart/cart_screens.dart';
import 'package:bebeautyapp/ui/home/homes/search/search_screens.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/brand/brand_card.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/brand/details_brand.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/category/categories.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BrandScreens extends StatelessWidget {
  final productServices = new ProductServices();

  @override
  Widget build(BuildContext context) {
    final brandProvider = Provider.of<BrandProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: kPrimaryColor,
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              // By default our  icon color is white
              color: kTextColor,
            ),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              // By default our  icon color is white
              color: kTextColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
          SizedBox(width: kDefaultPadding / 2)
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
                  // ListView.builder(
                  //      physics: NeverScrollableScrollPhysics(),
                  //      shrinkWrap: true,
                  //      scrollDirection: Axis.vertical,
                  //      itemCount: brandProvider.brands.length,
                  //      itemBuilder: (context, index) {
                  //        return index.isOdd ? SpecialOfferCard(
                  //          category: brandProvider.brands[index].getName(),
                  //          image: brandProvider.brands[index].getImage(),
                  //          numOfBrands: brandProvider.brands[index].productQuantity,
                  //          press: (){},
                  //        ): Container();},
                  //    ),
                  //
                  //   ListView.builder(
                  //      physics: NeverScrollableScrollPhysics(),
                  //      shrinkWrap: true,
                  //      scrollDirection: Axis.vertical,
                  //      itemCount: brandProvider.brands.length,
                  //      itemBuilder: (context, index) {
                  //        return index.isEven ?SpecialOfferCard(
                  //          category: brandProvider.brands[index].getName(),
                  //          image: brandProvider.brands[index].getImage(),
                  //          numOfBrands: brandProvider.brands[index].productQuantity,
                  //          press: (){},
                  //        ): Container();},
                  //    ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text(
                      "Brand",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: GridView.builder(
                        itemCount: brandProvider.brands.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: kDefaultPadding,
                          crossAxisSpacing: kDefaultPadding,
                          childAspectRatio: 1.15,
                        ),
                        itemBuilder: (context, index) => SpecialOfferCard(
                          category: brandProvider.brands[index].getName(),
                          image: brandProvider.brands[index].getImage(),
                          numOfBrands:
                              brandProvider.brands[index].productQuantity,
                          press: () {
                            List<MProduct> allProductsFromBrand =
                                productServices.getAllProductsFromBrand(
                                    productProvider.products,
                                    brandProvider.brands[index].id);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsBrand(
                                    brand: brandProvider.brands[index],
                                    allProductsFromBrand: allProductsFromBrand,
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
