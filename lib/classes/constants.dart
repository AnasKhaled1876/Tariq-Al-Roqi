import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';


class Constants {

  static bool tablet=false;
  static const String TYPE = "type",
      PRICE = "price",
      BED = "bedroom",
      BATH = "bathroom",
      MAID = "maid",
      STORE = "store",
      LIVING = "living",
      DINING = "dining",
      KITCHEN = "kitchen",
      MAJLS = "majls";

  static const Color roqiColor = Color(0xfff2c75c);



  static const backgroundColor = Color(0xff2c2c2c);
}

class SignButton extends StatelessWidget {

  const SignButton({Key? key, required this.path, required this.signText}) : super(key: key);

  final path;
  final String signText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            primary: Color(0xfff2c75c)),
        onPressed: path,
        child: Text(
          "$signText",
          style: TextStyle(fontSize: 12.sp, color: Colors.black),
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
          fixedSize: Size(Constants.tablet ? 47.w : double.infinity, Constants.tablet ? 6.h : 5.h),
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
      onPressed: () async {
         if(buttonText=="  Call")
            await launch("tel://+971585556767");
        else {
           var whatsappUrl = "https://wa.me/971585556767";
           await launch(whatsappUrl);
         }
      },
      child: Center(
        child: Container(
          width: 60.w,
          height: 5.5.h,
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
                  fontSize: Constants.tablet ? 17.sp :13.sp, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
