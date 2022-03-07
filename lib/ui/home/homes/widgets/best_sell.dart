
import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/repo/providers/product_provider.dart';
import 'package:bebeautyapp/repo/providers/user_provider.dart';
import 'package:bebeautyapp/repo/services/product_services.dart';
import 'package:bebeautyapp/ui/home/details/details_screen.dart';
import 'package:bebeautyapp/ui/home/homes/cart/Product.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/star_rating.dart';
import 'package:flutter/cupertino.dart';
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
                    return Padding(
                        padding: EdgeInsets.only(left: 20),
                        child:
                        ProductCard(product: products[index],
                      press: (){Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: products[index],
                          ),
                        ));},
                        ),
                    );
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
    this.width = 150,
    required this.product,
    required this.press,
  }) : super(key: key);

  final double width;
  final MProduct product;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    NumberFormat currencyformat = new NumberFormat("#,###,##0");
    final productServices = new ProductServices();
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return SizedBox(
        width: width,
        child: GestureDetector(
          onTap: press,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                    Stack(
                      children:[ Container(
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
                        Positioned(
                          right: -18,
                          top: -10,
                          child: Container(
                            padding: EdgeInsets.only(left: 16.0),
                            alignment: Alignment.topRight,
                                child: Stack(
                                  children:[
                                   SizedBox(
                                         height: 90*0.5833333333333334,
                                         width: 90,
                                         child: CustomPaint(
                                              painter: RPSCustomPainter(),
                                              size: Size(90,(90*0.5833333333333334).toDouble()),
                                         ),
                                       ),
                                     Container(
                                      padding: EdgeInsets.only(left: 38,top: 10),
                                        child: Text(
                                          product.defaultDiscountRate.toString()+'%'+'\nsale ',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                        ],
                                  ),
                                ),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 8,
                  ),
                  Stack(
                    children:[ Row(
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

                              ],
                            ),
                            overflow: TextOverflow.visible,
                            maxLines: 8,
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
                          ],
                  ),

              StarRating(rating: product.totalStarRating/product.totalRating, size: 15),
                ],
              )
        ),
      );
  }
}
class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color(0xffFFD839)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(size.width*0.3750000,size.height*0.2128571);
    path0.lineTo(size.width*0.3755000,size.height*1);
    path0.lineTo(size.width*0.5825000,size.height*0.8428571);
    path0.lineTo(size.width*0.7920000,size.height*1);
    path0.lineTo(size.width*0.7910000,size.height*0.2157143);
    path0.lineTo(size.width*0.3750000,size.height*0.2128571);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


