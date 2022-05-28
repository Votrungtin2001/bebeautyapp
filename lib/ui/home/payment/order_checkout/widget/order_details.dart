import 'dart:ui';

import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/home/payment/order_checkout/widget/MTrackOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:im_stepper/stepper.dart';

import '../../../../../model/MOrder.dart';
import '../../../../../repo/services/order_services.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({Key? key, required this.order}) : super(key: key);

  @override
  _TrackOrderState createState() => _TrackOrderState();
  final MOrder order;
}

class _TrackOrderState extends State<TrackOrder> {
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
                  children: [
                    // Container(
                    //   height: MediaQuery.of(context).size.height,
                    //   width: MediaQuery.of(context).size.width / 6,
                    //   child: IconStepper(
                    //     direction: Axis.vertical,
                    //     enableNextPreviousButtons: false,
                    //     enableStepTapping: false,
                    //     stepColor: kTextLightColor,
                    //     activeStepBorderColor: kTextLightColor,
                    //     activeStepBorderWidth: 0.0,
                    //     activeStepBorderPadding: 0.0,
                    //     lineColor: kTextLightColor,
                    //     lineDotRadius: 2.0,
                    //     stepRadius: 16.0,
                    //     icons: [
                    //       Icon(Icons.check, color: Colors.white),
                    //       Icon(Icons.check, color: kTextColor),
                    //       Icon(Icons.check, color: kTextColor),
                    //       Icon(Icons.check, color: kTextColor),
                    //       Icon(Icons.check, color: kTextColor),
                    //       Icon(Icons.check, color: kTextColor),
                    //     ],
                    //   ),
                    // ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: trackOrderList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 1.3,
                                padding: const EdgeInsets.only(left: 16),
                                child: ListTile(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  leading: Container(
                                    height: 48,
                                    width: 48,
                                    child:
                                        Image.asset(trackOrderList[index].img),
                                    // child: SvgPicture.asset(
                                    //     'assets/icons/order_placed.svg'),
                                  ),
                                  title: Text(
                                    trackOrderList[index].title,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  subtitle: Text(
                                    trackOrderList[index].subtitle,
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                              Text(
                                trackOrderList[index].time,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 16.0),
            //   padding: const EdgeInsets.only(left: 24.0, top: 16.0, bottom: 16.0),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(
            //       width: 0.5,
            //       color: kLightColor,
            //     ),
            //     borderRadius: BorderRadius.circular(8.0),
            //   ),
            //   child: Row(
            //     children: [
            //       Icon(Icons.home, size: 64.0, color: kPrimaryColor),
            //       const SizedBox(width: 32.0),
            //       Container(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               "Bui Thanh Phu",
            //               style: TextStyle(fontSize: 20.0),
            //             ),
            //             Text(
            //               "0123123128",
            //               style: TextStyle(
            //                 fontSize: 17.0,
            //                 color: kDarkColor.withOpacity(0.7),
            //               ),
            //             ),
            //             Container(
            //               width: MediaQuery.of(context).size.width / 1.8,
            //               child: Text(
            //                 "120 XL Hà Nội, Thành Phố, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam",
            //                 style: TextStyle(
            //                   fontSize: 15.0,
            //                   color: kDarkColor.withOpacity(0.5),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
