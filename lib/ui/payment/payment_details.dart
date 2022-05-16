import 'package:awesome_card/awesome_card.dart';
import 'package:bebeautyapp/ui/home/product_details/components/sticky_label.dart';
import 'package:bebeautyapp/ui/payment/payment_screen.dart';

import 'package:flutter/material.dart';

import '../../constants.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            StickyLabel(
              text: "Transaction Details",
              textStyle: kPop400TextStyle,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.5,
                  color: kLightColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: kLightColor,
                        ),
                      ),
                      Container(
                        width: 190.0,
                        child: Text(
                          '2',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Container(
                        width: 70.0,
                        child: Text(
                          '3',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 0.5,
                    color: kLightColor,
                  );
                },
              ),
            ),
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry: cardExpiry,
              cardHolderName: cardHolderName,
              bankName: bankName,
              cvv: cvv,
              // showBackSide: true,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              cardType: CardType.masterCard,
              showShadow: true,
            ),
            StickyLabel(
              text: "Card Information",
              textStyle: kBigTitleTextStyle,
            ),
            SizedBox(height: 8.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.5,
                  color: kLightColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("My Perosnal Card",
                            style: TextStyle(fontSize: 18.0)),
                        Container(
                            width: 60.0,
                            child: Icon(Icons.payment,
                                color: kPrimaryColor, size: 40.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Number",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: kLightColor,
                              ),
                            ),
                            Text(
                              cardNumber,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Container(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Exp.",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: kLightColor,
                                ),
                              ),
                              Text(
                                cardExpiry,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Name",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: kLightColor,
                              ),
                            ),
                            Text(
                              cardHolderName,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Container(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CVV",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: kLightColor,
                                ),
                              ),
                              Text(
                                cvv,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 48.0,
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      color: kDarkColor.withOpacity(0.2),
                      child: Text(
                        "Edit Detail",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Payment()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
