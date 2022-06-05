import 'dart:ui';

import 'package:bebeautyapp/constants.dart';

import 'package:flutter/material.dart';
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16, top: 8.0, right: 16),
              height: 74,
              width: 400,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
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
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, top: 8.0, right: 16),
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
