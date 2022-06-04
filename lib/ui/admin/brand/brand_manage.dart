import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/repo/providers/brand_provider.dart';
import 'package:bebeautyapp/repo/providers/product_provider.dart';
import 'package:bebeautyapp/repo/services/product_services.dart';
import 'package:bebeautyapp/ui/admin/Brand/detail_brand_manage.dart';
import 'package:bebeautyapp/ui/authenication/register/widgets/custom_rounded_loading_button.dart';
import 'package:bebeautyapp/ui/home/homes/widgets/brand/brand_card.dart';
import 'package:bebeautyapp/ui/home/product_details/components/sticky_label.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class BrandManage extends StatelessWidget {
  final productServices = new ProductServices();
  BrandManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final brandProvider = Provider.of<BrandProvider>(context);
    final _formKey = GlobalKey<FormState>();
    final addButtonController = RoundedLoadingButtonController();
    String name = '';
    String url = '';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: const Text("Brand Manage"),
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: GridView.builder(
                  itemCount: brandProvider.brands.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPadding,
                    crossAxisSpacing: kDefaultPadding,
                    childAspectRatio: 1.15,
                  ),
                  itemBuilder: (context, index) => SpecialOfferCard(
                    category: brandProvider.brands[index].getName(),
                    image: brandProvider.brands[index].getImage(),
                    numOfBrands: brandProvider.brands[index].productQuantity,
                    press: () {
                      List<MProduct> allProductsFromBrand =
                          productServices.getAllProductsFromBrand(
                              productProvider.products,
                              brandProvider.brands[index].id);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsBrandManage(
                              brand: brandProvider.brands[index],
                              allProductsFromBrand: allProductsFromBrand,
                            ),
                          ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: MaterialButton(
        shape: CircleBorder(),
        elevation: 2.0,
        padding: EdgeInsets.all(12.0),
        color: kPrimaryColor,
        textColor: Colors.white,
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AlertDialog(
            insetPadding:
                EdgeInsets.symmetric(horizontal: 30.0, vertical: 170.0),
            contentPadding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
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
                StickyLabel(text: 'Name', textStyle: TextStyle(fontSize: 14)),
                TextFormField(
                  onChanged: (value) {
                    name = value;
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
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: kPrimaryColor, width: 1),
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
                    url = value;
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
                      borderSide: BorderSide(color: kPrimaryColor, width: 1),
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
                CustomRoundedLoadingButton(
                  text: 'Add',
                  controller: addButtonController,
                  onPress: () {},
                ),
              ],
            ),
          ),
        ),
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
