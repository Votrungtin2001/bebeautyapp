import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/repo/providers/product_provider.dart';
import 'package:bebeautyapp/repo/providers/user_provider.dart';
import 'package:bebeautyapp/repo/services/preference_services.dart';
import 'package:bebeautyapp/repo/services/product_services.dart';
import 'package:bebeautyapp/ui/home/details/details_screen.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/best_sell/best_sell.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/product_card.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/product_column.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/recommend_product/recommend_product_screens.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/same_brand/same_brand.dart';
import 'package:bebeautyapp/ui/home/product_details/components/review_ui.dart';
import 'package:bebeautyapp/ui/home/product_details/components/sticky_label.dart';
import 'package:bebeautyapp/ui/home/product_details/reviews/reviews.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:bebeautyapp/constants.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../homes/widgets/recommend_product/recommend_product.dart';
import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatefulWidget {
  const Body(
      {Key? key,
      required this.product,
      required this.similarProductsFromSelectedProducts})
      : super(key: key);
  final MProduct product;
  final List<MProduct> similarProductsFromSelectedProducts;

  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  final preferenceServices = new PreferenceServices();
  final productServices = new ProductServices();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    int currentIndex = 0;
    NumberFormat currencyformat = new NumberFormat("#,###,##0");
    bool isMore = false;
    PageController pageController = PageController(initialPage: 0);
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    @override
    void initState() {
      super.initState();
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: kFourthColor,
            height: 300,
            child: PageView.builder(
              controller: pageController,
              itemCount: widget.product.images.length,
              pageSnapping: true,
              itemBuilder: (context, index) {
                return Image.network(
                  widget.product.images[index],
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          //     Container(
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: List.generate(
          //           widget.product.images.length,
          //               (index) => AnimatedContainer(
          //             duration: Duration(milliseconds: 400),
          //             height: 8.0,
          //             width: currentIndex == index ? 10.0 : 8.0,
          //             margin: EdgeInsets.only(right: 4.0),
          //             decoration: BoxDecoration(
          //               color: currentIndex == index
          //                   ? kPrimaryColor
          //                   : kLightColor,
          //               borderRadius: BorderRadius.circular(8.0),
          //             ),
          //           ),
          //         ),
          //       ),
          // ),
          SizedBox(height: kDefaultPadding / 2),
          Text(
            widget.product.engName,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: kDefaultPadding),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              widget.product.name,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: kDefaultPadding),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  currencyformat.format(widget.product.getMarketPrice()) + 'đ',
                  style: new TextStyle(
                    color: Colors.grey,
                    fontSize: 30,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  currencyformat.format(widget.product.getPrice()) + 'đ',
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 300,
              child: DefaultTabController(
                length: 4,
                child: TabBarView(
                  children: <Widget>[
                    HomeTopTabs(widget.product),
                    HomeTopTabs(widget.product),
                    HomeTopTabs(widget.product),
                    HomeTopTabs(widget.product),
                  ],
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StickyLabel(
                text: "Review",
                textStyle: kPop600TextStyle,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Reviews(),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: kDefaultPadding),
                  child: StickyLabel(
                    text: "View All",
                    textStyle: TextStyle(
                        color: kTextLightColor,
                        fontSize: 16.0,
                        fontFamily: "Poppins"),
                  ),
                ),
              ),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
            itemCount: 3,
            itemBuilder: (context, index) {
              return ReviewUI(
                image: reviewList[index].image,
                name: reviewList[index].name,
                date: reviewList[index].date,
                comment: reviewList[index].comment,
                rating: reviewList[index].rating,
                onPressed: () => print("More Action $index"),
                onTap: () => setState(() {
                  isMore = !isMore;
                }),
                isLess: isMore,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 2.0,
                color: kAccentColor,
              );
            },
          ),
          kSmallDivider,
          SameBrand(productServices.getProductsFromSameBrand(
              productProvider.products, widget.product)),
          const SizedBox(
            height: 16,
          ),
          Row(children: const <Widget>[
            Expanded(
                child: Divider(
              indent: 24,
              endIndent: 16,
              thickness: 1.5,
            )),
            Text(
              "You aslo may like",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  letterSpacing: -1,
                  color: kTextColor),
            ),
            Expanded(
                child: Divider(
              indent: 24,
              endIndent: 16,
              thickness: 1.5,
            )),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 150,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: GridView.builder(
                          itemCount: widget.similarProductsFromSelectedProducts
                                      .length >
                                  6
                              ? 6
                              : widget
                                  .similarProductsFromSelectedProducts.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: kDefaultPadding,
                            crossAxisSpacing: kDefaultPadding,
                            childAspectRatio: 0.5,
                          ),
                          itemBuilder: (context, index) => ProductCard(
                            product: widget
                                .similarProductsFromSelectedProducts[index],
                            press: () async {
                              productProvider
                                      .isNeededUpdated_SimilarProductsBasedUserByCBR =
                                  true;
                              await preferenceServices.updatePreference(
                                  userProvider.user,
                                  widget.similarProductsFromSelectedProducts[
                                      index]);

                              //productProvider.isNeededUpdated_SimilarProductsByCFR = true;
                              //await preferenceServices.updatePreference(userProvider.user, widget.similarProductsFromSelectedProducts[index]);
                              List<MProduct>
                                  similarProductsFromSelectedProducts =
                                  await productServices
                                      .getSimilarityProductsBySelectedProduct(
                                          productProvider.products,
                                          widget.similarProductsFromSelectedProducts[
                                              index]);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    // builder: (context) => DetailsScreen(
                                    //   product: products[index],
                                    // ),
                                    builder: (context) => DetailsScreen(
                                      product: widget
                                              .similarProductsFromSelectedProducts[
                                          index],
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
        ],
      ),
    );
  }

  HomeTopTabs(product) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(53.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.white,
            bottom: TabBar(
              isScrollable: true,
              indicatorWeight: 6.0,
              indicatorColor: kPrimaryColor,
              unselectedLabelColor: Colors.black,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Product specifications',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    'Main ingredient',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    'User manual',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    'Rate',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              child: Description(product: product),
            ),
            Container(
              child: Description(product: product),
            ),
            Container(
              child: Description(product: product),
            ),
            Container(
              child: Description(product: product),
            ),
          ],
        ),
      ),
    );
  }
}
