
import 'package:bebeautyapp/repo/providers/product_provider.dart';
import 'package:bebeautyapp/repo/services/product_services.dart';
import 'package:bebeautyapp/ui/home/details/widgets/cart_counter.dart';
import 'package:bebeautyapp/ui/home/homes/cart/cart_screens.dart';
import 'package:bebeautyapp/ui/home/homes/search/search_screens.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/best_sell/best_sell.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/new_product/new_product.dart';
import 'package:bebeautyapp/ui/home/product_details/reviews/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

import 'components/review_ui.dart';
import 'components/sticky_label.dart';

class ProductDetails extends StatefulWidget {


  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  bool isMore = false;
  final productServices = new ProductServices();

  List<String> detailImages = [
    "assets/images/product_detail.jpg",
    "assets/images/product_detail_1.jpg",
    "assets/images/product_detail_2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
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
      ),
      bottomNavigationBar: Material(
        elevation: kLess,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8.0, left: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor, width: 2.0),
              ),
              child: IconButton(
                icon: Icon(Icons.add_shopping_cart, color: kPrimaryColor),
                onPressed: () => {addToCartDrawer(context)},
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor, width: 2.0),
              ),
              child: IconButton(
                icon: Icon(Icons.chat, color: kPrimaryColor),
                onPressed: () {}

              ),
            ),
            Expanded(
              child: Container(
                height: 52.0,
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor, width: 2.0),
                ),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: kLessPadding),
                  color: kPrimaryColor,
                  textColor: Colors.white,
                  child: Text("Buy now", style: TextStyle(fontSize: 18.0,fontFamily: 'Poppins')),
                  onPressed: () {}
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 250.0,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemCount: detailImages.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        detailImages[index],
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 0.0,
                  right: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      detailImages.length,
                          (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        height: 8.0,
                        width: currentIndex == index ? 24.0 : 8.0,
                        margin: EdgeInsets.only(right: 4.0),
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? kPrimaryColor
                              : kLightColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            StickyLabel(text: "Name Product", textStyle: kBigTitleTextStyle,),
            Padding(
              padding: EdgeInsets.only(left: kDefaultPadding),
              child: Text(
                "\$ ${76.12}",
                style: TextStyle(fontSize: 20.0, color: Colors.red,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14.0, vertical: 4.0),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "8.9",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontFamily: 'Poppins'
                            ),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.top,
                            child: Icon(
                              Icons.star,
                              size: 18.0,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      "${826} Sale",
                      style: kPop400TextStyle
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: kLessPadding),
            kSmallDivider,
            // for shirt or Other Products who has the Size
            Padding(
              padding: EdgeInsets.only(left: kDefaultPadding),
              child: Text(
                "Desciption",
                style: kPop600TextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  top: kLessPadding),
              child: isMore
                  ? Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra orci sagittis eu volutpat odio facilisis mauris sit amet massa vitae tortor condimentum lacinia quis vel eros donec ac odio",
                style: kPop400TextStyle,
              )
                  : Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel fringilla est ullamcorper eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra orci sagittis eu volutpat odio facilisis mauris sit amet massa vitae tortor condimentum lacinia quis vel eros donec ac odio",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: kPop400TextStyle,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                isMore = !isMore;
              }),
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: kDefaultPadding),
                  child: Text(
                    isMore ? "View Less" : "View More",
                    style: TextStyle(color: kTextLightColor, fontSize: 16.0,fontFamily: "Poppins"),
                  ),
                ),
              ),
            ),
            kSmallDivider,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StickyLabel(text: "Review", textStyle: kPop600TextStyle,),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Reviews(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: kDefaultPadding),
                    child:
                    StickyLabel(text: "View All",  textStyle: TextStyle(color: kTextLightColor, fontSize: 16.0,fontFamily: "Poppins"),),
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
                return Divider(
                  thickness: 2.0,
                  color: kAccentColor,
                );
              },
            ),
            kSmallDivider,
            BestSell(productServices.getTop10BestSellerProduct(productProvider.products)),
            SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }
}

void addToCartDrawer(BuildContext context) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0)
        ),
      ),
      isDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          height: 240.0,
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: AspectRatio(
                        aspectRatio: 0.88,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            //color: Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset("assets/image/product1"),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              Text("10000đ"),
                              Spacer(),
                              Text("Kho: 213"),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ) ,
              ),
              Divider(thickness: 1,),
              Row(
                children: [
                  Text("Số lượng: "),
                  Spacer(),
                  CartCounter(),
                ],
              ),
              RaisedButton(
                onPressed: () {

                },
                color: kPrimaryColor,
                padding: EdgeInsets.symmetric(horizontal: 50),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.white),
                ),
              )
            ],
          )
        );
      }
      );
}