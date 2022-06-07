import 'dart:ui';

import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/model/MStatus.dart';
import 'package:bebeautyapp/repo/services/cart_services.dart';
import 'package:bebeautyapp/ui/home/product_details/components/sticky_label.dart';

import 'package:flutter/material.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:im_stepper/stepper.dart';

import '../../../../../model/MOrder.dart';
import '../../../../../repo/services/order_services.dart';

class TrackOrderManage extends StatefulWidget {
  const TrackOrderManage({Key? key, required this.order}) : super(key: key);

  @override
  _TrackOrderManageState createState() => _TrackOrderManageState();
  final MOrder order;
}

class _TrackOrderManageState extends State<TrackOrderManage> {
  final orderServices = new OrderServices();
  List<MStatus> status = [
    MStatus(id: 0, name: "Pending"),
    MStatus(id: 1, name: "To Pay"),
    MStatus(id: 2, name: "To Ship"),
    MStatus(id: 3, name: "To Receive"),
    MStatus(id: 4, name: "Completed"),
    MStatus(id: 5, name: "Rating"),
    MStatus(id: -1, name: "Cancelled"),
  ];

  late int statusId;
  @override
  void initState() {
    super.initState();
    statusId = widget.order.status;
  }

  final cartServices = new CartServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: kPrimaryColor),
        title: const Text(
          'TRACK ORDER',
          style: TextStyle(
            fontFamily: "Laila",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: kPrimaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          widget.order.status == 0
              ? TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Cancell',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ))
              : widget.order.status == 1
                  ? TextButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Cancell',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                    )
                  : Container(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16, top: 8.0, right: 16),
              height: 350,
              width: 400,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.order.getDate(),
                        style: TextStyle(
                          fontSize: 18.0,
                          color: kLightColor,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Order ID : ",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: kLightColor,
                            ),
                          ),
                          SelectableText(
                            widget.order.getID(),
                            toolbarOptions: ToolbarOptions(
                                copy: true,
                                selectAll: true,
                                cut: false,
                                paste: false),
                            style: TextStyle(
                              fontSize: 18.0,
                              color: kCopy,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.order.getUserName(),
                        style: const TextStyle(
                          fontFamily: 'Popppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        widget.order.getPhone(),
                        style: const TextStyle(
                          fontFamily: 'Popppins',
                          fontSize: 16,
                          color: kTextLightColor,
                        ),
                      ),
                      Text(
                        widget.order.getAddress(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: kTextLightColor,
                        ),
                      ),
                      widget.order.status != 5
                          ? Column(
                              children: [
                                StickyLabel(
                                    text: 'Status',
                                    textStyle: TextStyle(fontSize: 14)),
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.0, bottom: 4.0),
                                    child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: DropdownButton<String>(
                                          hint: Text("Select"),
                                          dropdownColor: Colors.white,
                                          icon: Icon(Icons.arrow_drop_down),
                                          iconSize: 36,
                                          isExpanded: true,
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 16,
                                          ),
                                          underline: SizedBox(),
                                          value: statusId.toString(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              statusId = int.parse(
                                                  newValue.toString());
                                            });
                                          },
                                          items: status
                                              .map<DropdownMenuItem<String>>(
                                                  (MStatus value) {
                                            return DropdownMenuItem<String>(
                                              value: value.id.toString(),
                                              child: Text(value.getName()),
                                            );
                                          }).toList(),
                                        ))),
                              ],
                            )
                          : Container(),
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
                              Text(
                                'Discount:',
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
                                cartServices
                                    .totalValueOfSelectedProductsInCart(
                                        widget.order.productsInCart)
                                    .toStringAsFixed(0)
                                    .toVND(unit: 'đ'),
                                style: const TextStyle(
                                    fontFamily: 'Popppins',
                                    fontSize: 18,
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                widget.order
                                    .getShippingValue()
                                    .toStringAsFixed(0)
                                    .toVND(unit: 'đ'),
                                style: const TextStyle(
                                    fontFamily: 'Popppins',
                                    fontSize: 18,
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                widget.order
                                    .getDiscountValue()
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
                            widget.order
                                .getTotalPayment()
                                .toStringAsFixed(0)
                                .toVND(unit: 'đ'),
                            style: const TextStyle(
                                fontFamily: 'Popppins',
                                fontSize: 18,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.order.getProductsInOrder().length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.network(
                              widget.order
                                  .getProductsInOrder()[index]
                                  .getImage(),
                              height: 100,
                              width: 100,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 12.0),
                              width: 230,
                              child: Text(
                                widget.order
                                    .getProductsInOrder()[index]
                                    .getName(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                            Text(
                                'x${widget.order.getProductsInOrder()[index].getQuantity()}'),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
