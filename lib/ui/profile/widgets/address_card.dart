import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/profile/widgets/Address_class.dart';
import 'package:bebeautyapp/ui/profile/widgets/change_address.dart';

import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
    required this.address,
  }) : super(key: key);

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.white,
      child: ListTile(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeAddressScreen(
                      address: address,
                    )),
          ),
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
        leading: Icon(
          Icons.location_on_outlined,
          color: kPrimaryColor,
        ),
        minLeadingWidth: 24,
        trailing: address.addressDefault == true
            ? const Text(
                '[Default]',
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              )
            : Text(''),
        title: Text(address.name),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(address.phoneNumber),
          Text(address.address),
        ]),
      ),
    );
  }
}
