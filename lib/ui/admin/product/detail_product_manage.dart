import 'package:bebeautyapp/model/MProduct.dart';
import 'package:bebeautyapp/ui/authenication/register/widgets/custom_rounded_loading_button.dart';
import 'package:bebeautyapp/ui/home/details/widgets/cart_counter.dart';

import 'package:bebeautyapp/ui/home/cart/cart_screens.dart';
import 'package:bebeautyapp/ui/home/homes/search/search_screens.dart';
import 'package:bebeautyapp/ui/home/product_details/components/sticky_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/home/details/widgets/body.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../repo/providers/cart_provider.dart';
import '../../../repo/providers/product_provider.dart';
import '../../../repo/providers/user_provider.dart';
import '../../../repo/services/product_services.dart';

class DetailsProductManageScreen extends StatelessWidget {
  final MProduct product;

  final productServices = ProductServices();

  DetailsProductManageScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    final _formKey = GlobalKey<FormState>();
    final editButtonController = RoundedLoadingButtonController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: kPrimaryColor,
        ),
        title: Text('Product'),
        titleTextStyle: const TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
            fontFamily: 'Laila',
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                StickyLabel(text: 'Name', textStyle: TextStyle(fontSize: 14)),
                TextFormField(
                  onChanged: (value) {
                    product.name = value;
                  },
                  initialValue: product.name,
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
                CustomRoundedLoadingButton(
                  text: 'Save',
                  controller: editButtonController,
                  onPress: () {},
                ),
                Container(
                    width: 400,
                    height: 40,
                    child: OutlinedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.0),
                                      side: BorderSide(color: kPrimaryColor)))),
                      onPressed: () {},
                      child: Text('Delete',
                          style: TextStyle(
                              color: kPrimaryColor, fontSize: 20, height: 1.5)),
                    ))
              ],
            ),
          )),
    );
  }
}
