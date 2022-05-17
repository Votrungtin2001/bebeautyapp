import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constants.dart';

class CompleteOrder extends StatefulWidget {
  @override
  _CompleteOrder createState() => _CompleteOrder();
}

class _CompleteOrder extends State<CompleteOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            color: kPrimaryColor,
          ),
          onPressed: () {},
        ),
        title: Text("Check out"),
        titleTextStyle: TextStyle(
            color: kPrimaryColor,
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700),
        centerTitle: true,
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 48,
            ),
            Center(
              child: SizedBox(
                  height: 164,
                  width: 164,
                  child: SvgPicture.asset("assets/icons/complete.svg")),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Congratulations!!!",
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Laila",
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1,
                  color: kTextColor),
            ),
            const SizedBox(
              height: 32,
            ),
            const SizedBox(
              width: 220,
              child: Text(
                "Your order have been taken and is being attended to",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    letterSpacing: -1,
                    color: kTextColor),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            RaisedButton(
              onPressed: () {},
              color: kPrimaryColor,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "Track order",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins",
                    letterSpacing: -1,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            OutlineButton(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              borderSide: BorderSide(color: kPrimaryColor, width: 1),
              onPressed: () {},
              child: const Text("Continue shopping",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      letterSpacing: -1,
                      color: kPrimaryColor)),
            ),
          ],
        ),
      ),
    );
  }
}
