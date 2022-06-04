import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/model/MBrand.dart';

import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/repo/providers/brand_provider.dart';
import 'package:bebeautyapp/repo/providers/category_provider.dart';
import 'package:bebeautyapp/repo/providers/product_provider.dart';
import 'package:bebeautyapp/repo/providers/user_provider.dart';
import 'package:bebeautyapp/repo/services/preference_services.dart';
import 'package:bebeautyapp/repo/services/product_services.dart';
import 'package:bebeautyapp/ui/authenication/register/widgets/custom_rounded_loading_button.dart';
import 'package:bebeautyapp/ui/home/details/details_screen.dart';
import 'package:bebeautyapp/ui/home/cart/cart_screens.dart';
import 'package:bebeautyapp/ui/home/homes/search/search_screens.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/best_sell/best_sell.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/category/categories.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/item_card.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/product_card.dart';
import 'package:bebeautyapp/ui/home/product_details/components/sticky_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class DetailsBrandManage extends StatefulWidget {
  final MBrand brand;
  final List<MProduct> allProductsFromBrand;

  const DetailsBrandManage(
      {Key? key, required this.brand, required this.allProductsFromBrand})
      : super(key: key);
  @override
  _DetailsBrandManage createState() => new _DetailsBrandManage();
}

class _DetailsBrandManage extends State<DetailsBrandManage> {
  @override
  Widget build(BuildContext context) {
    final preferenceServices = new PreferenceServices();
    final productProvider = Provider.of<ProductProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final editButtonController = RoundedLoadingButtonController();
    final productServices = new ProductServices();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: kPrimaryColor,
        ),
        title: Text(widget.brand.name),
        titleTextStyle: const TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontFamily: 'Laila',
            fontWeight: FontWeight.w700),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                insetPadding:
                    EdgeInsets.symmetric(horizontal: 30.0, vertical: 80.0),
                contentPadding:
                    const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Center(child: Text('Add Brand')),
                    CloseButton(
                      color: kPrimaryColor,
                    )
                  ],
                ),
                content: Column(
                  children: [
                    StickyLabel(
                        text: 'Name', textStyle: TextStyle(fontSize: 14)),
                    TextFormField(
                      onChanged: (value) {
                        widget.brand.name = value;
                      },
                      cursorColor: kTextColor,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Name is empty';
                        } else
                          return null;
                      },
                      // controller:
                      //     Provider.of<SignIn_Function>(context, listen: false)
                      //         .emailController,
                      initialValue: widget.brand.name,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: kPrimaryColor, width: 1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.red, width: 1),
                        ),
                      ),
                    ),
                    StickyLabel(
                        text: 'Image URL', textStyle: TextStyle(fontSize: 14)),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          widget.brand.imageUri = value;
                        });
                      },
                      cursorColor: kTextColor,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'URL is empty';
                        } else
                          return null;
                      },
                      // controller:
                      //     Provider.of<SignIn_Function>(context, listen: false)
                      //         .emailController,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: kPrimaryColor, width: 1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.red, width: 1),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 120,
                      width: 120,
                      child: Image.network(widget.brand.imageUri),
                    ),
                    CustomRoundedLoadingButton(
                      text: 'Save',
                      controller: editButtonController,
                      onPress: () {},
                    ),
                    Container(
                      width: 300,
                      child: OutlinedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.0),
                                      side: BorderSide(color: kPrimaryColor)))),
                          onPressed: () {},
                          child: Text(
                            'Delete',
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 18),
                          )),
                    )
                  ],
                ),
              ),
            ),
            icon: const Icon(
              Icons.edit,
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
                          itemCount: widget.allProductsFromBrand.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: kDefaultPadding,
                            crossAxisSpacing: kDefaultPadding,
                            childAspectRatio: 0.5,
                          ),
                          itemBuilder: (context, index) => ProductCard(
                            rating: false,
                            product: widget.allProductsFromBrand[index],
                            press: () async {
                              productProvider
                                      .isNeededUpdated_SimilarProductsBasedUserByCBR =
                                  true;
                              await preferenceServices.updatePreference(
                                  userProvider.user,
                                  widget.allProductsFromBrand[index]);

                              List<MProduct>
                                  similarProductsFromSelectedProducts =
                                  await productServices
                                      .getSimilarityProductsBySelectedProduct(
                                          productProvider.products,
                                          widget.allProductsFromBrand[index]);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      product:
                                          widget.allProductsFromBrand[index],
                                      similarProductsFromSelectedProducts:
                                          similarProductsFromSelectedProducts,
                                    ),
                                  ));
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
