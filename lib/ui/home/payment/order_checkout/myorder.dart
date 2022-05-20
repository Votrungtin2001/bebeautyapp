import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/home/payment/order_checkout/widget/ProductEx.dart';
import 'package:bebeautyapp/ui/home/payment/order_checkout/widget/product_container.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyOrderScreen extends StatefulWidget {
  final int index;
  const MyOrderScreen({Key? key, required this.index}) : super(key: key);

  @override
  _MyOrderScreen createState() => _MyOrderScreen();
}

class _MyOrderScreen extends State<MyOrderScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.animateTo(2);
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

  static final List<Widget> _views = [
    Center(
      child: demoProduct.isEmpty
          ? Center(child: not_orders)
          : ListView.builder(
              itemCount: demoProduct.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: ProductContainer(
                      productEx: demoProduct[index],
                    ),
                  )),
    ),
    Center(
      child: demoProduct.isEmpty
          ? Center(child: not_orders)
          : ListView.builder(
              itemCount: demoProduct.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: ProductContainer(
                      productEx: demoProduct[index],
                    ),
                  )),
    ),
    Center(
      child: demoProduct.isEmpty
          ? Center(child: not_orders)
          : ListView.builder(
              itemCount: demoProduct.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: ProductContainer(
                      productEx: demoProduct[index],
                    ),
                  )),
    ),
    Center(
      child: demoProduct.isEmpty
          ? Center(child: not_orders)
          : ListView.builder(
              itemCount: demoProduct.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: ProductContainer(
                      productEx: demoProduct[index],
                    ),
                  )),
    ),
    Center(
      child: demoProduct.isEmpty
          ? Center(child: not_orders)
          : ListView.builder(
              itemCount: demoProduct.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: ProductContainer(
                      productEx: demoProduct[index],
                    ),
                  )),
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
          children: _views,
        ),
      ),
    );
  }
}
