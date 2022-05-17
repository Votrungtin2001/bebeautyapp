import 'package:awesome_card/awesome_card.dart';
import 'package:bebeautyapp/repo/services/address_services.dart';
import 'package:bebeautyapp/ui/home/cart/Cart.dart';
import 'package:bebeautyapp/ui/home/cart/Product.dart';
import 'package:bebeautyapp/ui/home/payment/widget/address_selection.dart';
import 'package:bebeautyapp/ui/home/product_details/components/sticky_label.dart';
import 'package:bebeautyapp/ui/home/payment/payment_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key, required this.productCardEx})
      : super(key: key);
  final List<Cart> productCardEx;
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  String cardNumber = "5450 7879 4864 7854",
      cardExpiry = "10/25",
      cardHolderName = "John Travolta",
      bankName = "ICICI Bank",
      cvv = "456";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: BackButton(color: kPrimaryColor),
        title: Text(
          'Checkout',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Poppins',
            color: kPrimaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddressSelecion(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                color: Colors.white,
                child: Row(children: [
                  SvgPicture.asset(
                    'assets/icons/location.svg',
                    color: kPrimaryColor,
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Address',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Bui Thanh Phu',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '09321309123174701',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'khu pho 6 ling trung hu ducc',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 16,
                  ),
                ]),
              ),
            ),
            StickyLabel(
              text: "Product",
              textStyle: kPop400TextStyle,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                        widget.productCardEx.first.product.images.first),
                  ),
                  Text(
                    widget.productCardEx.first.product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      'x' + widget.productCardEx.first.numOfItem.toString(),
                      style: TextStyle(
                          color: kTextColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/dollars.png',
                        color: kPrimaryColor,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Payment Option',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        'Cash on Delivery',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 16,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Merchandise Subtotal',
                            style: TextStyle(
                                color: kTextLightColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Shipping Subtotal Subtotal',
                            style: TextStyle(
                                color: kTextLightColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Voucher Discount',
                            style: TextStyle(
                                color: kTextLightColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Total Payment',
                            style: TextStyle(
                                color: kTextColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '100000'.toVND(unit: 'đ'),
                            style: TextStyle(
                                color: kTextLightColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '100000'.toVND(unit: 'đ'),
                            style: TextStyle(
                                color: kTextLightColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '-10000'.toVND(unit: 'đ'),
                            style: TextStyle(
                                color: kTextLightColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '100000'.toVND(unit: 'đ'),
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.list_alt),
                  SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('By clicking "Place Order", you are agreeing to'),
                      Text(
                        "Shopee's General Transaction Terms",
                        style: TextStyle(
                          color: kCopy,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //   CreditCard(
            //     cardNumber: cardNumber,
            //     cardExpiry: cardExpiry,
            //     cardHolderName: cardHolderName,
            //     bankName: bankName,
            //     cvv: cvv,
            //     // showBackSide: true,
            //     frontBackground: CardBackgrounds.black,
            //     backBackground: CardBackgrounds.white,
            //     cardType: CardType.masterCard,
            //     showShadow: true,
            //   ),
            //   StickyLabel(
            //     text: "Card Information",
            //     textStyle: kBigTitleTextStyle,
            //   ),
            //   SizedBox(height: 8.0),
            //   Container(
            //     margin: EdgeInsets.symmetric(horizontal: 24.0),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       border: Border.all(
            //         width: 0.5,
            //         color: kLightColor,
            //       ),
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //     child: Column(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.symmetric(
            //             horizontal: 24.0,
            //             vertical: 8.0,
            //           ),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text("My Perosnal Card",
            //                   style: TextStyle(fontSize: 18.0)),
            //               Container(
            //                   width: 60.0,
            //                   child: Icon(Icons.payment,
            //                       color: kPrimaryColor, size: 40.0)),
            //             ],
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 24.0),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     "Card Number",
            //                     style: TextStyle(
            //                       fontSize: 16.0,
            //                       color: kLightColor,
            //                     ),
            //                   ),
            //                   Text(
            //                     cardNumber,
            //                     style: TextStyle(fontSize: 16.0),
            //                   ),
            //                 ],
            //               ),
            //               Container(
            //                 width: 45.0,
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       "Exp.",
            //                       style: TextStyle(
            //                         fontSize: 16.0,
            //                         color: kLightColor,
            //                       ),
            //                     ),
            //                     Text(
            //                       cardExpiry,
            //                       style: TextStyle(fontSize: 16.0),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(
            //             horizontal: 24.0,
            //             vertical: 8.0,
            //           ),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     "Card Name",
            //                     style: TextStyle(
            //                       fontSize: 16.0,
            //                       color: kLightColor,
            //                     ),
            //                   ),
            //                   Text(
            //                     cardHolderName,
            //                     style: TextStyle(fontSize: 16.0),
            //                   ),
            //                 ],
            //               ),
            //               Container(
            //                 width: 45.0,
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       "CVV",
            //                       style: TextStyle(
            //                         fontSize: 16.0,
            //                         color: kLightColor,
            //                       ),
            //                     ),
            //                     Text(
            //                       cvv,
            //                       style: TextStyle(fontSize: 16.0),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         Container(
            //           height: 48.0,
            //           width: MediaQuery.of(context).size.width,
            //           child: FlatButton(
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.only(
            //                 bottomLeft: Radius.circular(10.0),
            //                 bottomRight: Radius.circular(10.0),
            //               ),
            //             ),
            //             color: kDarkColor.withOpacity(0.2),
            //             child: Text(
            //               "Edit Detail",
            //               style: TextStyle(fontSize: 16.0),
            //             ),
            //             onPressed: () => Navigator.push(
            //               context,
            //               MaterialPageRoute(builder: (context) => Payment()),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            //   SizedBox(height: 8.0),
          ],
        ),
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total Payment:\n",
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
                      color: kPrimaryColor,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: null,
                        child: Text(
                          'Place Order',
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
}
