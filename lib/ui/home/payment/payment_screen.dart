import 'package:flutter/material.dart';

import '../../../constants.dart';

class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int? value = 0;

  final paymentLabels = [
    'Credit card / Debit card',
    'Cash on delivery',
    'Paypal',
  ];
  final paymentIcons = [
    Icons.credit_card,
    Icons.money_off,
    Icons.account_balance_wallet,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Choose your payment method'),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: kPrimaryColor,
                    value: index,
                    groupValue: value,
                    onChanged: (int? i) => setState(() => value = i),
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: TextStyle(color: kDarkColor),
                  ),
                  trailing: Icon(paymentIcons[index], color: kPrimaryColor),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          // RaisedButton(
          //   child:Text( 'Pay'),
          //   onPressed: () => Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => Success(),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
