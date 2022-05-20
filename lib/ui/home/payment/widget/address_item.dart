import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/home/cart/Cart.dart';
import 'package:bebeautyapp/ui/profile/widgets/Address_class.dart';
import 'package:flutter/material.dart';

class AddressItem extends StatefulWidget {
  final Address address;
  final ValueChanged<bool> isSelected;

  const AddressItem({Key? key, required this.address, required this.isSelected})
      : super(key: key);

  @override
  _AddressItemState createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: isSelected
                ? Container(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.check_box,
                      color: kPrimaryColor,
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.check_box_outline_blank,
                      color: kPrimaryColor,
                    ),
                  ),
          ),
          Container(
            color: kPrimaryColor.withOpacity(isSelected ? 0.05 : 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.address.name,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Text(
                  widget.address.phoneNumber,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kTextLightColor),
                ),
                Text(
                  widget.address.address,
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kTextLightColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
