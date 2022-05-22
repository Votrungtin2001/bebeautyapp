import 'dart:async';

import 'package:awesome_card/awesome_card.dart';
import 'package:bebeautyapp/repo/services/address_services.dart';
import 'package:bebeautyapp/ui/home/cart/Cart.dart';
import 'package:bebeautyapp/ui/home/cart/Product.dart';
import 'package:bebeautyapp/ui/home/cart/cart_card.dart';
import 'package:bebeautyapp/ui/home/payment/widget/address_selection.dart';
import 'package:bebeautyapp/ui/home/payment/widget/complete_order.dart';
import 'package:bebeautyapp/ui/home/product_details/components/sticky_label.dart';
import 'package:bebeautyapp/ui/home/payment/payment_screen.dart';
import 'package:bebeautyapp/ui/profile/widgets/Address_class.dart';

import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show cos, sqrt, asin;
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
  late Address address = new Address(
      name: 'Bui thanh phu',
      phoneNumber: '0932131231298',
      address: 'khu opho6 ling trunng thu ducc',
      addressDefault: true);

  List<LatLng> polylineCoordinates = [];
  String? _placeDistance;

  FutureOr onGoBack(dynamic value) {
    address = value;
    setState(() {});
  }

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
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddressSelection())).then(onGoBack);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              color: Colors.white,
              child: Row(children: [
                SvgPicture.asset(
                  'assets/icons/location.svg',
                  color: kPrimaryColor,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Address',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      address.name,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      address.phoneNumber,
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      child: Text(
                        address.address,
                        style: TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                const Icon(
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
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.productCardEx.length,
              itemBuilder: (context, index) =>
                  CartCard(cart: widget.productCardEx[index]),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/dollars.png',
                      color: kPrimaryColor,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      'Payment Option',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                    const Spacer(),
                    const Text(
                      'Cash on Delivery',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Merchandise Subtotal',
                          style: TextStyle(
                              color: kTextLightColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Shipping Subtotal Subtotal',
                          style: TextStyle(
                              color: kTextLightColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Voucher Discount',
                          style: TextStyle(
                              color: kTextLightColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Total Payment',
                          style: TextStyle(
                              color: kTextColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '100000'.toVND(unit: 'đ'),
                          style: const TextStyle(
                              color: kTextLightColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '100000'.toVND(unit: 'đ'),
                          style: const TextStyle(
                              color: kTextLightColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '-10000'.toVND(unit: 'đ'),
                          style: const TextStyle(
                              color: kTextLightColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '100000'.toVND(unit: 'đ'),
                          style: const TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Icon(Icons.list_alt),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('By clicking "Place Order", you are agreeing to'),
                    Text(
                      "BeBeauty's General Transaction Terms",
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
          //   const SizedBox(height: 8.0),
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
          //   const SizedBox(height: 8.0),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.15),
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
                  const Text.rich(
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
                    height: 50,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                      onPressed: () {
                        _calculateDistance();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompleteOrder()),
                        );
                      },
                      child: Text(
                        'Place Order',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method for calculating the distance between two places
  Future<bool> _calculateDistance() async {
    try {
      // Retrieving placemarks from addresses
      List<Location> startPlacemark = await locationFromAddress(
          '2 Nguyễn Bỉnh Khiêm, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh 700000, Việt Nam');
      List<Location> destinationPlacemark =
          await locationFromAddress(address.address);
      print(address.address);

      // Use the retrieved coordinates of the current position,
      // instead of the address if the start position is user's
      // current position, as it results in better accuracy.
      double startLatitude = startPlacemark[0].latitude;

      double startLongitude = startPlacemark[0].longitude;

      double destinationLatitude = destinationPlacemark[0].latitude;
      double destinationLongitude = destinationPlacemark[0].longitude;

      String startCoordinatesString = '($startLatitude, $startLongitude)';
      String destinationCoordinatesString =
          '($destinationLatitude, $destinationLongitude)';

      print(
        'START COORDINATES: ($startLatitude, $startLongitude)',
      );
      print(
        'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
      );
      polylineCoordinates.add(LatLng(startLatitude, startLongitude));
      polylineCoordinates
          .add(LatLng(destinationLatitude, destinationLongitude));

      // Calculating the distance between the start and the end positions
      // with a straight path, without considering any route
      // double distanceInMeters = await Geolocator.bearingBetween(
      //   startLatitude,
      //   startLongitude,
      //   destinationLatitude,
      //   destinationLongitude,
      // );
      double khoangcanh = Geolocator.distanceBetween(startLatitude,
              startLongitude, destinationLatitude, destinationLongitude) /
          1000;
      print('DISTANCE 1: ' + khoangcanh.toStringAsFixed(2) + ' km');

      double totalDistance = 0.0;
      // Calculating the total distance by adding the distance
      // between small segments
      for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += _coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }

      setState(() {
        _placeDistance = totalDistance.toStringAsFixed(2);
        print('DISTANCE: $_placeDistance km');
      });

      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  // Formula for calculating distance between two coordinates
  // https://stackoverflow.com/a/54138876/11910277
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
