import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/model/MBrand.dart';

import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/repo/providers/product_provider.dart';
import 'package:bebeautyapp/repo/providers/user_provider.dart';
import 'package:bebeautyapp/repo/services/preference_services.dart';
import 'package:bebeautyapp/repo/services/product_services.dart';
import 'package:bebeautyapp/ui/admin/Product/detail_product_manage.dart';
import 'package:bebeautyapp/ui/authenication/register/widgets/custom_rounded_loading_button.dart';
import 'package:bebeautyapp/ui/home/details/details_screen.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/product_card.dart';
import 'package:bebeautyapp/ui/home/product_details/components/sticky_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ProductManage extends StatefulWidget {
  ProductManage({Key? key}) : super(key: key);
  final productServices = new ProductServices();
  @override
  _ProductManage createState() => new _ProductManage();
}

class _ProductManage extends State<ProductManage> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final preferenceServices = new PreferenceServices();
    final userProvider = Provider.of<UserProvider>(context);
    final editButtonController = RoundedLoadingButtonController();
    MProduct tempt = new MProduct(
        id: 0,
        name: '',
        engName: '',
        brandID: 0,
        categoryID: 0,
        originID: 0,
        skinID: 0,
        sessionID: 0,
        genderID: 0,
        structureID: 0,
        soldOut: 0,
        totalStarRating: 0,
        totalRating: 0,
        marketPrice: 0,
        importPrice: 0,
        defaultDiscountRate: 0,
        price: 0,
        chemicalComposition: '',
        guideLine: '',
        images: [],
        userFavorite: [],
        available: 0,
        searchCount: 0,
        popularSearchTitle: '',
        description: '');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: kPrimaryColor,
        ),
        title: const Text('Product Manage'),
        titleTextStyle: const TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontFamily: 'Laila',
            fontWeight: FontWeight.w700),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsProductManageScreen(
                            product: tempt,
                          )));
            },
            icon: const Icon(
              Icons.add,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 153,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: GridView.builder(
                          itemCount: productProvider.products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: kDefaultPadding,
                            crossAxisSpacing: kDefaultPadding,
                            childAspectRatio: 0.5,
                          ),
                          itemBuilder: (context, index) => ProductCard(
                            rating: false,
                            product: productProvider.products[index],
                            press: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsProductManageScreen(
                                            product:
                                                productProvider.products[index],
                                          )));
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
