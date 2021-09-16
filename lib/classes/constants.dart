import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Constants{

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

}

class ContactButton extends StatelessWidget {
  const ContactButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize:Size(double.infinity, 30.0),primary: Colors.black),
      onPressed: () {
        launch("tel://+971585556767");
      },
      child: Text(
        "Contact our Office",
        style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
  }
}