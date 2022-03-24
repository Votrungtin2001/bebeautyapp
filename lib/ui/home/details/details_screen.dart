import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/ui/home/details/widgets/cart_counter.dart';
import 'package:bebeautyapp/ui/home/details/widgets/nested.dart';
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
      backgroundColor: Color(0xffc1c2c6).withOpacity(0.2),
      appBar: buildAppBar(context),
      drawer: Drawer(),
      body: SingleChildScrollView(child: Body(product: product)),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => nested_tab_bar()),);

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
                ),
              ],
            )
        );
      }
  );
}