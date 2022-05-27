import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/profile/widgets/Address_class.dart';
import 'package:flutter/material.dart';

import '../../../../model/MSavedAddress.dart';

class AddressItem extends StatefulWidget {
  final MSavedAddress savedAddress;

  const AddressItem({Key? key, required this.savedAddress}) : super(key: key);

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
            widget.savedAddress.fullUserName,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Text(
            widget.savedAddress.userPhone,
            style:
                TextStyle(fontWeight: FontWeight.w600, color: kTextLightColor),
          ),
          Text(
            widget.savedAddress.fullAddressName,
            style:
                TextStyle(fontWeight: FontWeight.w600, color: kTextLightColor),
          ),
        ],
      ),
    ]);
  }
}
