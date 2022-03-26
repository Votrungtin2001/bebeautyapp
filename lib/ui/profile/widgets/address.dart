
import 'package:bebeautyapp/ui/authenication/register/widgets/custom_rounded_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';


import '../../../constants.dart';

class DeliveryAddress extends StatefulWidget {


  final stateFocusNode = FocusNode();
  final cityFocusNode = FocusNode();
  final localityFocusNode = FocusNode();
  final pincodeFocusNode = FocusNode();

  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  final formKey = GlobalKey<FormState>();
  String state = "";
  String city = "";
  String locality = "";
  String pincode = "";

  TextEditingController _stateController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _localityController = TextEditingController();
  TextEditingController _pinCodeController = TextEditingController();


  final sendChangePasswordButtonController = RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Delivery Address"),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Poppins',fontWeight: FontWeight.w700),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Where are your ordered items shipped?",style: kTitleTextStyle,),
            TextFormField(
              focusNode: widget.stateFocusNode,
              onChanged: (value) {
                state = value;
              },
              obscureText: false,
              cursorColor: kTextColor,
              controller: _stateController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.map,
                  color: Colors.black,
                ),
                hintText: "State",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: Colors.black,
                      width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
              ),
            ),
            SizedBox(
              height: kFixPadding,
            ),
            TextFormField(
              focusNode: widget.cityFocusNode,
              onChanged: (value) {
                city = value;
              },
              cursorColor: kTextColor,
              obscureText: false,
              controller: _cityController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.location_city,
                  color: Colors.black,
                ),
                hintText: "City",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: Colors.black,
                      width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
              ),
            ),
            SizedBox(
              height: kFixPadding,
            ),
            TextFormField(
              focusNode: widget.localityFocusNode,
              onChanged: (value) {
                locality = value;
              },
              cursorColor: kTextColor,
              obscureText: false,
              controller: _localityController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.landscape,
                  color: Colors.black,
                ),
                hintText: "Locality",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: Colors.black,
                      width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
              ),
            ),

            SizedBox(
              height: kFixPadding,
            ),
            TextFormField(
              focusNode: widget.pincodeFocusNode,
              onChanged: (value) {
                pincode = value;
              },
              cursorColor: kTextColor,
              obscureText: false,
              controller: _pinCodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.location_city,
                  color: Colors.black,
                ),
                hintText: "Pincode",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: kPrimaryColor, width: 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: Colors.black,
                      width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
              ),
            ),

            SizedBox(
              height: kDefaultPadding,
            ),



            CustomRoundedLoadingButton(
              text: 'Save',
              onPress: () {},
              controller: sendChangePasswordButtonController,
              horizontalPadding: 45,
            ),
          ],
        ),
      ),
    );
  }
}