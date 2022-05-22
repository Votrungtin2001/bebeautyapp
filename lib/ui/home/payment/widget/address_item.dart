import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/home/cart/Cart.dart';
import 'package:bebeautyapp/ui/profile/widgets/Address_class.dart';
import 'package:flutter/material.dart';

class AddressItem extends StatefulWidget {
  final Address address;

  const AddressItem({Key? key, required this.address}) : super(key: key);

  @override
  _AddressItemState createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.address.name,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Text(
            widget.address.phoneNumber,
            style:
                TextStyle(fontWeight: FontWeight.w600, color: kTextLightColor),
          ),
          Text(
            widget.address.address,
            style:
                TextStyle(fontWeight: FontWeight.w600, color: kTextLightColor),
          ),
        ],
      ),
    ]);
  }
}
