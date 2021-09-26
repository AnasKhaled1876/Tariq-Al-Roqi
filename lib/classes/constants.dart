import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:url_launcher/url_launcher.dart';

class Constants {

  static String TYPE = "type",
      PRICE = "price",
      BED = "bedroom",
      BATH = "bathroom",
      MAID = "maid",
      STORE = "store",
      LIVING = "living",
      DINING = "dining",
      KITCHEN = "kitchen",
      MAJLS = "majls";

  static const Color roqi = Color.fromRGBO(234, 181, 101, 1.0);

  static const backgroundColor = Color(0xff2c2c2c);
}

class SignButton extends StatelessWidget {

  const SignButton({Key? key, required this.path, required this.signText}) : super(key: key);

  final path;
  final String signText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            primary: Colors.white),
        onPressed: path,
        child: Text(
          "$signText",
          style: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
      ),
    );
  }
}



class ContactButton extends StatelessWidget {
  const ContactButton({Key? key, required this.buttonText}) : super(key: key);
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 40.0),
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
      onPressed: () {
        // if(buttonText=="Call")
        //    launch("tel://+971585556767");
        // else
        //    var whatsappUrl ="whatsapp://send?phone=$phone";
        // await canLaunch(whatsappUrl)? launch(whatsappUrl)
      },
      child: Center(
        child: ListTile(contentPadding: EdgeInsets.zero,
          dense: true,
          leading: buttonText == "  Call"
              ? Icon(
                  FontAwesomeIcons.phone,
                  color: Colors.white,
                )
              : Icon(
                  FontAwesomeIcons.envelope,
                  color: Colors.white,
                ),
          title: Text(
            "$buttonText",
            style: TextStyle(
                fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
