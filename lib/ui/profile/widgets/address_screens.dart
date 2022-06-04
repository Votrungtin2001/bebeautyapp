import 'package:bebeautyapp/ui/authenication/register/widgets/custom_rounded_loading_button.dart';
import 'package:bebeautyapp/ui/profile/widgets/Address_class.dart';
import 'package:bebeautyapp/ui/profile/widgets/address.dart';
import 'package:bebeautyapp/ui/profile/widgets/address_card.dart';
import 'package:bebeautyapp/ui/profile/widgets/change_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../constants.dart';
import '../../../repo/providers/user_provider.dart';

class AddressScreens extends StatefulWidget {
  @override
  _AddressScreens createState() => _AddressScreens();
}

class _AddressScreens extends State<AddressScreens> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text("Delivery Address"),
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
            child: ListView.builder(
              itemCount: demoAddress.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(demoAddress[index].toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      demoAddress.removeAt(index);
                    });
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: kFourthColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/trash.svg"),
                      ],
                    ),
                  ),
                  child: AddressCard(address: demoAddress[index]),
                ),
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: MaterialButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AddAddressScreen(userID: userProvider.user.id)),
                ),
              },
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "    Add new address",
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
