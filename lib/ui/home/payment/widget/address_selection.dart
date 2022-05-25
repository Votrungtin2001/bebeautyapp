import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/authenication/register/widgets/custom_rounded_loading_button.dart';
import 'package:bebeautyapp/ui/home/payment/widget/address_item.dart';
import 'package:bebeautyapp/ui/profile/widgets/Address_class.dart';
import 'package:bebeautyapp/ui/profile/widgets/address.dart';
import 'package:bebeautyapp/ui/profile/widgets/address_card.dart';
import 'package:bebeautyapp/ui/profile/widgets/change_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AddressSelection extends StatefulWidget {
  @override
  _AddressSelection createState() => _AddressSelection();
}

class _AddressSelection extends State<AddressSelection> {
  late Address address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text("Address Selection"),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: demoAddress.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: AddressItem(
                        address: demoAddress[index],
                      ),
                      onTap: () {
                        Navigator.pop(context, demoAddress[index]);
                      });
                }),
          ),
          Card(
            color: Colors.white,
            child: FlatButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAddressScreen()),
                ),
              },
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Add new address",
                    style: TextStyle(
                        fontSize: 14, fontFamily: 'Poppins', color: kTextColor),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
