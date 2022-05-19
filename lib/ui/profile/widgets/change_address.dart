import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/authenication/register/widgets/custom_rounded_loading_button.dart';
import 'package:bebeautyapp/ui/profile/widgets/Address_class.dart';
import 'package:bebeautyapp/ui/profile/widgets/gg_map.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChangeAddressScreen extends StatefulWidget {
  const ChangeAddressScreen({
    Key? key,
    required this.address,
  }) : super(key: key);

  final Address address;

  @override
  _ChangeAddressScreen createState() => _ChangeAddressScreen();
}

class _ChangeAddressScreen extends State<ChangeAddressScreen> {
  final formKey = GlobalKey<FormState>();

  final nameFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final addressFocusNode = FocusNode();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text("Change Address"),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever_outlined),
            color: Colors.white,
            onPressed: () {
              _deleteDialog();
            },
          ),
        ],
      ),
      body: Container(
        color: kTextLightColor.withOpacity(0.15),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            'Contact',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(color: kTextColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        focusNode: nameFocusNode,
                        onChanged: (value) {
                          widget.address.name = value;
                        },
                        cursorColor: kTextColor,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Name is empty';
                          }
                          return null;
                        },
                        initialValue: widget.address.name,
                        //controller: _nameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                              icon: Icon(Icons.close_rounded),
                              onPressed: () => _nameController.clear()),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      TextFormField(
                        focusNode: phoneNumberFocusNode,
                        onChanged: (value) {
                          widget.address.phoneNumber = value;
                        },
                        cursorColor: kTextColor,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Phone Number is empty';
                          }
                          return null;
                        },
                        initialValue: widget.address.phoneNumber,
                        //controller: _phoneController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                              icon: Icon(Icons.close_rounded),
                              onPressed: () => _phoneController.clear()),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            'Address',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(color: kTextColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        focusNode: addressFocusNode,
                        onChanged: (value) {
                          widget.address.address = value;
                        },
                        cursorColor: kTextColor,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Address is empty';
                          }
                          return null;
                        },
                        initialValue: widget.address.address,
                        //controller: _addressController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                              icon: Icon(Icons.close_rounded),
                              onPressed: () => _phoneController.clear()),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            // Position position = await _getGeoLocationPosition();
                            // location =
                            //     'Lat: ${position.latitude} , Long: ${position.longitude}';
                            // GetAddressFromLatLong(position);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapView()),
                            );
                          },
                          child: Text('Get Location')),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Set default address',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  color: kTextColor,
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: FlutterSwitch(
                                height: 25.0,
                                width: 50.0,
                                padding: 4.0,
                                toggleSize: 17.5,
                                borderRadius: 15.0,
                                activeColor: kPrimaryColor,
                                value: widget.address.addressDefault,
                                onToggle: (value) {
                                  setState(() {
                                    widget.address.addressDefault = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                        color: Colors.white,
                        minWidth: MediaQuery.of(context).size.width - 30,
                        onPressed: () => {},
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              color: kTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _deleteDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Are you sure to delete this Address?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _backDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update'),
          content: const Text(
              'Update has not been saved. Are you sure you want to cancel the change?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Exit'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
