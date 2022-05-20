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

class AddressSelecion extends StatefulWidget {
  @override
  _AddressSelecion createState() => _AddressSelecion();
}

class _AddressSelecion extends State<AddressSelecion> {
  bool selectedIndex = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text("Address Selecion"),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: demoAddress.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 4,
                ),
                itemBuilder: (context, index) {
                  return AddressItem(
                      address: demoAddress[index],
                      isSelected: (bool value) {
                        setState(() {
                          if (value) {
                            selectedIndex = value;
                          }
                        });
                      },
                      key: Key(demoAddress[index].toString()));
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
              padding: EdgeInsets.all(8.0),
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
