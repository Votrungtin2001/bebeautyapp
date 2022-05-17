import 'package:bebeautyapp/constants.dart';
import 'package:bebeautyapp/ui/authenication/register/widgets/custom_rounded_loading_button.dart';
import 'package:bebeautyapp/ui/profile/widgets/address.dart';
import 'package:bebeautyapp/ui/profile/widgets/change_address.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AddressSelecion extends StatefulWidget {
  @override
  _AddressSelecion createState() => _AddressSelecion();
}

class _AddressSelecion extends State<AddressSelecion> {
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
                      const SizedBox(height: 10.0),
                      GestureDetector(
                        // onTap: () => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => ChangeAddressScreen()),
                        // ),
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: Text('Tên'),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8.0),
                                      Text('Số điện thoại'),
                                      const SizedBox(height: 8.0),
                                      Text('Địa chỉ'),
                                    ],
                                  ),
                                  trailing: Icon(
                                    Icons.location_on_outlined,
                                    size: 30,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        child: FlatButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DeliveryAddress()),
                            ),
                          },
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "    Add new address",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    color: kTextColor),
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
