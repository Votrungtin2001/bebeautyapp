import 'dart:async';

import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/home/payment/order_checkout/widget/product_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../model/MOrder.dart';
import '../../../../model/MProduct.dart';
import '../../../../model/MProductInCart.dart';
import '../../../../repo/providers/product_provider.dart';
import '../../../../repo/services/order_services.dart';

class MyOrderScreen extends StatefulWidget {
  final int index;
  final String userID;
  const MyOrderScreen({Key? key, required this.index, required this.userID}) : super(key: key);

  @override
  _MyOrderScreen createState() => _MyOrderScreen();
}

class _MyOrderScreen extends State<MyOrderScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  Stream<QuerySnapshot>? payOrders;
  Stream<QuerySnapshot>? shippingOrders;
  Stream<QuerySnapshot>? receivedOrders;
  Stream<QuerySnapshot>? completedOrders;
  Stream<QuerySnapshot>? ratingOrders;
  final orderServices = new OrderServices();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.animateTo(2);

    getOrders();

  }

  getOrders() async {
    await orderServices.getOrderByUserID(widget.userID, 0).then((snapshots) {
      setState(() {
        payOrders = snapshots;
      });
    });

    await orderServices.getOrderByUserID(widget.userID, 1).then((snapshots) {
      setState(() {
        shippingOrders = snapshots;
      });
    });

    await orderServices.getOrderByUserID(widget.userID, 2).then((snapshots) {
      setState(() {
        receivedOrders = snapshots;
      });
    });

    await orderServices.getOrderByUserID(widget.userID, 3).then((snapshots) {
      setState(() {
        completedOrders = snapshots;
      });
    });

    await orderServices.getOrderByUserID(widget.userID, 4).then((snapshots) {
      setState(() {
        ratingOrders = snapshots;
      });
    });

  }

  static const List<Tab> _tabs = [
    Tab(text: 'To Pay'),
    Tab(text: 'To Ship'),
    Tab(text: 'To Receive'),
    Tab(text: 'Completed'),
    Tab(text: 'Cancelled'),
  ];

  static Widget not_orders = Column(
    children: [
      Container(
        height: 200,
        width: 200,
        child: SvgPicture.asset('assets/icons/not_order.svg'),
      ),
      Text('No Orders Yet'),
    ],
  );

  Widget PayOrderList(List<MProduct> products) {
    return StreamBuilder<QuerySnapshot>(
        stream: payOrders,
        builder: (context, snapshot) {
          return snapshot.hasData && snapshot.data!.docs.length > 0
              ? ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                MOrder order = new MOrder(snapshot.data!.docs[index]["orderID"],
                    snapshot.data!.docs[index]["userID"],
                    snapshot.data!.docs[index]["voucherCode"],
                    snapshot.data!.docs[index]["discountValue"],
                    snapshot.data!.docs[index]["shippingValue"],
                    snapshot.data!.docs[index]["totalPayment"],
                    snapshot.data!.docs[index]["totalQuantity"],
                    snapshot.data!.docs[index]["numOfProducts"],
                    snapshot.data!.docs[index]["address"],
                    snapshot.data!.docs[index]["latitude"],
                    snapshot.data!.docs[index]["longitude"],
                    snapshot.data!.docs[index]["userName"],
                    snapshot.data!.docs[index]["phone"],
                    snapshot.data!.docs[index]["time"],
                    snapshot.data!.docs[index]["status"]);

                return Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: ProductContainer(
                    order: order,
                    products: products,
                  ),
                );
              })
              : Center(child: not_orders);
        }
    );
  }

  Widget ShippingOrderList(List<MProduct> products) {
    return StreamBuilder<QuerySnapshot>(
        stream: shippingOrders,
        builder: (context, snapshot) {
          return snapshot.hasData && snapshot.data!.docs.length > 0
              ? ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                MOrder order = new MOrder(snapshot.data!.docs[index]["orderID"],
                    snapshot.data!.docs[index]["userID"],
                    snapshot.data!.docs[index]["voucherCode"],
                    snapshot.data!.docs[index]["discountValue"],
                    snapshot.data!.docs[index]["shippingValue"],
                    snapshot.data!.docs[index]["totalPayment"],
                    snapshot.data!.docs[index]["totalQuantity"],
                    snapshot.data!.docs[index]["numOfProducts"],
                    snapshot.data!.docs[index]["address"],
                    snapshot.data!.docs[index]["latitude"],
                    snapshot.data!.docs[index]["longitude"],
                    snapshot.data!.docs[index]["userName"],
                    snapshot.data!.docs[index]["phone"],
                    snapshot.data!.docs[index]["time"],
                    snapshot.data!.docs[index]["status"]);

                return Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: ProductContainer(
                    order: order,
                    products: products,
                  ),
                );
              })
              : Center(child: not_orders);
        }
    );
  }

  Widget ReceivedOrderList(List<MProduct> products) {
    return StreamBuilder<QuerySnapshot>(
        stream: receivedOrders,
        builder: (context, snapshot) {
          return snapshot.hasData && snapshot.data!.docs.length > 0
              ? ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                MOrder order = new MOrder(snapshot.data!.docs[index]["orderID"],
                    snapshot.data!.docs[index]["userID"],
                    snapshot.data!.docs[index]["voucherCode"],
                    snapshot.data!.docs[index]["discountValue"],
                    snapshot.data!.docs[index]["shippingValue"],
                    snapshot.data!.docs[index]["totalPayment"],
                    snapshot.data!.docs[index]["totalQuantity"],
                    snapshot.data!.docs[index]["numOfProducts"],
                    snapshot.data!.docs[index]["address"],
                    snapshot.data!.docs[index]["latitude"],
                    snapshot.data!.docs[index]["longitude"],
                    snapshot.data!.docs[index]["userName"],
                    snapshot.data!.docs[index]["phone"],
                    snapshot.data!.docs[index]["time"],
                    snapshot.data!.docs[index]["status"]);

                return Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: ProductContainer(
                    order: order,
                    products: products,
                  ),
                );
              })
              : Center(child: not_orders);
        }
    );
  }

  Widget CompletedOrderList(List<MProduct> products) {
    return StreamBuilder<QuerySnapshot>(
        stream: completedOrders,
        builder: (context, snapshot) {
          return snapshot.hasData && snapshot.data!.docs.length > 0
              ? ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                MOrder order = new MOrder(snapshot.data!.docs[index]["orderID"],
                    snapshot.data!.docs[index]["userID"],
                    snapshot.data!.docs[index]["voucherCode"],
                    snapshot.data!.docs[index]["discountValue"],
                    snapshot.data!.docs[index]["shippingValue"],
                    snapshot.data!.docs[index]["totalPayment"],
                    snapshot.data!.docs[index]["totalQuantity"],
                    snapshot.data!.docs[index]["numOfProducts"],
                    snapshot.data!.docs[index]["address"],
                    snapshot.data!.docs[index]["latitude"],
                    snapshot.data!.docs[index]["longitude"],
                    snapshot.data!.docs[index]["userName"],
                    snapshot.data!.docs[index]["phone"],
                    snapshot.data!.docs[index]["time"],
                    snapshot.data!.docs[index]["status"]);

                return Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: ProductContainer(
                    order: order,
                    products: products,
                  ),
                );
              })
              : Center(child: not_orders);
        }
    );
  }

  Widget CancelledOrderList(List<MProduct> products) {
    return StreamBuilder<QuerySnapshot>(
        stream: ratingOrders,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                MOrder order = new MOrder(snapshot.data!.docs[index]["orderID"],
                    snapshot.data!.docs[index]["userID"],
                    snapshot.data!.docs[index]["voucherCode"],
                    snapshot.data!.docs[index]["discountValue"],
                    snapshot.data!.docs[index]["shippingValue"],
                    snapshot.data!.docs[index]["totalPayment"],
                    snapshot.data!.docs[index]["totalQuantity"],
                    snapshot.data!.docs[index]["numOfProducts"],
                    snapshot.data!.docs[index]["address"],
                    snapshot.data!.docs[index]["latitude"],
                    snapshot.data!.docs[index]["longitude"],
                    snapshot.data!.docs[index]["userName"],
                    snapshot.data!.docs[index]["phone"],
                    snapshot.data!.docs[index]["time"],
                    snapshot.data!.docs[index]["status"]);
                return Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: ProductContainer(
                    order: order,
                    products: products,
                  ),
                );
              })
              : Center(child: not_orders);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return DefaultTabController(
      initialIndex: widget.index,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: kPrimaryColor,
            unselectedLabelColor: kTextLightColor,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                const TextStyle(fontSize: 14, fontFamily: 'Poppins'),
            overlayColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.transparent;
              }
              if (states.contains(MaterialState.focused)) {
                return Colors.transparent;
              } else if (states.contains(MaterialState.hovered)) {
                return Colors.transparent;
              }
              return Colors.transparent;
            }),
            indicatorWeight: 3,
            indicatorColor: kPrimaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            enableFeedback: true,
            tabs: _tabs,
          ),
          leading: const BackButton(color: kPrimaryColor),
          title: const Text(
            'MY ORDER',
            style: TextStyle(
              fontFamily: "Laila",
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: kPrimaryColor,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
          // controller: _tabController,
          children: [
            PayOrderList(productProvider.products),
            ShippingOrderList(productProvider.products),
            ReceivedOrderList(productProvider.products),
            CompletedOrderList(productProvider.products),
            CancelledOrderList(productProvider.products),
          ],
        ),
      ),
    );
  }
}
