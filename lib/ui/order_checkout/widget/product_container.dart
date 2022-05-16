import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/order_checkout/widget/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:intl/intl.dart';

import 'ProductEx.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    Key? key,
    required this.productEx,
  }) : super(key: key);

  final ProductEx productEx;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TrackOrder(
                      productEx: productEx,
                    )),
          );
        },
        child: Container(
          height: 368,
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.only(left: 16, top: 8.0, right: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#' + productEx.id.toString(),
                      style: const TextStyle(
                        fontFamily: 'Popppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      productEx.numOfItems.toString() + ' item',
                      style: const TextStyle(
                        fontFamily: 'Popppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: kTextLightColor,
                  thickness: 1,
                ),
                Text(
                  productEx.name,
                  style: const TextStyle(
                    fontFamily: 'Popppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
                Text(
                  productEx.phoneNumber,
                  style: const TextStyle(
                    fontFamily: 'Popppins',
                    fontSize: 16,
                    color: kTextLightColor,
                  ),
                ),
                Text(
                  productEx.address,
                  style: const TextStyle(
                    fontSize: 16,
                    color: kTextLightColor,
                  ),
                ),
                const Divider(
                  color: kTextLightColor,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      child:
                          Image.asset(productEx.productTemp.first.imgProduct),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 228,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            productEx.productTemp.first.nameProduct,
                            textAlign: TextAlign.right,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'x' +
                                productEx.productTemp.first.numProduct
                                    .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    color: kTextColor,
                                    fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                productEx.numOfItems > 1
                    ? Column(
                        children: [
                          Divider(
                            color: kTextLightColor,
                            thickness: 1,
                          ),
                          Text('View more product'),
                          Divider(
                            color: kTextLightColor,
                            thickness: 1,
                          ),
                        ],
                      )
                    : Divider(
                        color: kTextLightColor,
                        thickness: 1,
                      ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order:',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontFamily: 'Popppins',
                              fontSize: 18,
                              color: kTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Delivery:',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontFamily: 'Popppins',
                              fontSize: 18,
                              color: kTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          productEx.price.toStringAsFixed(0).toVND(unit: 'đ'),
                          style: const TextStyle(
                              fontFamily: 'Popppins',
                              fontSize: 18,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          productEx.delivery
                              .toStringAsFixed(0)
                              .toVND(unit: 'đ'),
                          style: const TextStyle(
                              fontFamily: 'Popppins',
                              fontSize: 18,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  color: kTextLightColor,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Text(
                      'Total:',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontFamily: 'Popppins',
                          fontSize: 18,
                          color: kTextColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      productEx.total.toStringAsFixed(0).toVND(unit: 'đ'),
                      style: const TextStyle(
                          fontFamily: 'Popppins',
                          fontSize: 18,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
