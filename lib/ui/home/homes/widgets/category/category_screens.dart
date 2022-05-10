import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/model/MCategory.dart';
import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/repo/providers/category_provider.dart';
import 'package:bebeautyapp/repo/providers/product_provider.dart';
import 'package:bebeautyapp/repo/providers/user_provider.dart';
import 'package:bebeautyapp/repo/services/preference_services.dart';
import 'package:bebeautyapp/repo/services/product_services.dart';
import 'package:bebeautyapp/ui/home/details/details_screen.dart';
import 'package:bebeautyapp/ui/home/homes/cart/cart_screens.dart';
import 'package:bebeautyapp/ui/home/homes/search/search_screens.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/category/categories.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/item_card.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/product_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


class CategoryScreens extends StatefulWidget {
  final MCategory category;
  final List<MProduct> allProductsFromCategory;

  const CategoryScreens({Key? key, required this.category, required this.allProductsFromCategory}) : super(key: key);

  @override
  _CategoryScreensState createState() => _CategoryScreensState(this.category, this.allProductsFromCategory);
}


class _CategoryScreensState extends State<CategoryScreens> with TickerProviderStateMixin {
  final preferenceServices= new PreferenceServices();
  final productServices = new ProductServices();
  int length = 0;

  late MCategory category;
  late List<MProduct> allProductsFromCategory;

  _CategoryScreensState(MCategory Category, List<MProduct> Products) {
    this.category = Category;
    this.allProductsFromCategory = Products;
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final preferenceServices= new PreferenceServices();
    final productProvider = Provider.of<ProductProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 145,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categoryProvider.categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    icon: categoryProvider.categories[index].imageUri,
                    text: categoryProvider.categories[index].name,
                    press: () {
                      List<MProduct> results = productServices.getAllProductsFromCategory(productProvider.products, categoryProvider.categories[index].getID());
                      productProvider.updateProductsFromCategory(results);
                      setState(() {
                        allProductsFromCategory = productProvider.allProductsFromCategory;
                      });

                    },
                  );
                },
              ),
            ),
          ),
          Divider(
              color: Colors.black
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              category.name,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child:
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
                          height: MediaQuery.of(context).size.height-300,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                            child: GridView.builder(
                              itemCount: allProductsFromCategory.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: kDefaultPadding,
                                crossAxisSpacing: kDefaultPadding,
                                childAspectRatio: 0.5,
                              ),
                              itemBuilder: (context, index) => ProductCard(product: allProductsFromCategory[index],
                                press: () async {
                                  productProvider.isNeededUpdated_SimilarProductsBasedUserByCBR = true;
                                  await preferenceServices.updatePreference(userProvider.user, allProductsFromCategory[index]);

                                  //productProvider.isNeededUpdated_SimilarProductsByCFR = true;
                                  //await preferenceServices.updatePreference(userProvider.user, products[index]);

                                  List<MProduct> similarProductsFromSelectedProducts = await productServices.getSimilarityProductsBySelectedProduct(productProvider.products, allProductsFromCategory[index]);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        // builder: (context) => DetailsScreen(
                                        //   product: products[index],
                                        // ),
                                        builder: (context) => DetailsScreen(
                                          product: allProductsFromCategory[index],
                                          similarProductsFromSelectedProducts: similarProductsFromSelectedProducts,
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
          ),
        ],
      ),
    );
  }

}