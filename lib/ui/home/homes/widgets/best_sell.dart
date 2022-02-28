import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/repo/providers/product_provider.dart';
import 'package:bebeautyapp/repo/providers/user_provider.dart';
import 'package:bebeautyapp/repo/services/product_services.dart';
import 'package:bebeautyapp/ui/home/details/details_screen.dart';
import 'package:bebeautyapp/ui/home/homes/cart/Product.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'section_title.dart';

class BestSell extends StatelessWidget {
  late List<MProduct> products;
  BestSell(List<MProduct> Products) {
    this.products = Products;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal:20),
          child: SectionTitle(title: "Best sell", press: () {}),
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                products.length,
                    (index) {
                    return ProductCard(product: products[index],
                      // press: (){Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => DetailsScreen(
                      //       product: demoProducts[index],
                      //     ),
                      //   ));},
                    );

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: 20),
            ],
          ),
        )
      ],
    );
  }
}
class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    required this.product,
    //required this.press,
  }) : super(key: key);

  final double width;
  final MProduct product;
  //final Function press;

  @override
  Widget build(BuildContext context) {
    NumberFormat currencyformat = new NumberFormat("#,###,##0");
    final productServices = new ProductServices();
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: SizedBox(
        width: width,
        child: GestureDetector(
          //onTap: press(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                    Stack(
                      children:[ Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                            children: [
                              Hero(
                                tag: product.id.toString(),
                                child: Image.network(product.getImage(0)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            text: product.getName(),
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: '\n\n' + currencyformat.format(product.getMarketPrice()) + 'đ',
                                style: new TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              TextSpan(
                                text: '\n' + currencyformat.format(product.getPrice()) + 'đ',
                                style: new TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 18,
                                ),
                              ),
                          TextSpan(
                            text: product.defaultDiscountRate.toString(),
                            style: new TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              backgroundColor: Color(0xffFFD839),
                            ),
                          ),
                            ],
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () async {
                          bool result = await productServices.updateFavorite(product.getID(), userProvider.user.getID());
                          if(result == true) {
                            productProvider.updateUserFavorite(userProvider.user.getID(), product.getID());
                            Fluttertoast.showToast(msg: 'Add it to your favorite list successfully', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
                          }else {
                            productProvider.updateUserFavorite(userProvider.user.getID(), product.getID());
                            Fluttertoast.showToast(msg: 'Remove it in your favorite list successfully', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: productServices.checkFavorite(userProvider.user.id, product.getUserFavorite())
                                ? kPrimaryColor.withOpacity(0.15)
                                : kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/heart.svg",
                            color: productServices.checkFavorite(userProvider.user.getID(), product.getUserFavorite())
                                ? Color(0xFFFF4848)
                                : Color(0xFFDBDEE4),
                          ),
                        ),
                      ),
                    ],
                  ),

              StarRating(rating: product.totalStarRating/product.totalRating, size: 15),
                ],
              )
        ),
      ),
    );
  }
}
