import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/authenication/register/widgets/custom_rounded_loading_button.dart';
import 'package:bebeautyapp/ui/home/cart/Cart.dart';
import 'package:bebeautyapp/ui/home/cart/cart_card.dart';
import 'package:bebeautyapp/ui/home/cart/grid_item.dart';

import 'package:bebeautyapp/ui/home/payment/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreen createState() => new _CartScreen();
}

class _CartScreen extends State<CartScreen> {
  List<Cart> selectedList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Row(
        children: [
          // Text(
          //   "${demoCarts.length} items",
          //   style: TextStyle(
          //       color: Colors.white, fontSize: 18, fontFamily: 'Poppins'),
          // ),
          // ListView.builder(
          //   itemCount: demoCarts.length,
          //   itemBuilder: (context, index) => Padding(
          //     padding: EdgeInsets.symmetric(vertical: 10),
          //     child: Dismissible(
          //       key: Key(demoCarts[index].product.id.toString()),
          //       direction: DismissDirection.endToStart,
          //       onDismissed: (direction) {
          //         setState(() {
          //           demoCarts.removeAt(index);
          //         });
          //       },
          //       background: Container(
          //         padding: EdgeInsets.symmetric(horizontal: 20),
          //         decoration: BoxDecoration(
          //           color: kFourthColor,
          //           borderRadius: BorderRadius.circular(15),
          //         ),
          //         child: Row(
          //           children: [
          //             Spacer(),
          //             SvgPicture.asset("assets/icons/trash.svg"),
          //           ],
          //         ),
          //       ),
          //       child: CartCard(cart: demoCarts[index]),
          //     ),
          //   ),
          // ),
          Expanded(
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: demoCarts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 4,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return GridItem(
                      item: demoCarts[index],
                      isSelected: (bool value) {
                        setState(() {
                          if (value) {
                            selectedList.add(demoCarts[index]);
                          } else {
                            selectedList.remove(demoCarts[index]);
                          }
                        });
                      },
                      key: Key(demoCarts[index].toString()));
                }),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            )
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset("assets/icons/receipt.svg"),
                  ),
                  Spacer(),
                  Container(
                    width: 200,
                    child: TextField(
                      style: TextStyle(color: kTextLightColor, fontSize: 14),
                      decoration: InputDecoration(
                        labelText: 'Add voucher code',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          text: "\$337.15",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: RaisedButton(
                        color: kPrimaryColor,
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PaymentDetails(
                              productCardEx: selectedList,
                            ),
                          ),
                        ),
                        child: Text(
                          'Check Out',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: BackButton(color: kPrimaryColor),
      title: Text(
        selectedList.length < 1
            ? "Cart"
            : "${selectedList.length} item selected",
        style: TextStyle(
          fontFamily: "Laila",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
