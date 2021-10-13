import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tariq_al_raqi/classes/constants.dart';
import 'package:tariq_al_raqi/db_helper.dart';
import 'package:tariq_al_raqi/screens/start_screen.dart';
import 'designs_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static bool go = false;
  static const colorizeColors = [
    Color(0xffF6D06E),
    Color(0xff856220),
  ];


  static TextStyle colorizeTextStyle = TextStyle(
    fontSize: 25.sp,
  );


  void getData() async {
    await Firebase.initializeApp();
    go = await DBHelper().checkSigned();
    if (go) {
      final _auth = FirebaseAuth.instance;
      await _auth.signInAnonymously();
      await DBHelper().getDesigns();
    }
    // else{
    //   final _auth = FirebaseAuth.instance;
    //   await _auth.signInAnonymously();
    //   await DBHelper().getDesigns();
    // }
  }



  Widget build(BuildContext context) {
    if(SizerUtil.deviceType==DeviceType.tablet)
      Constants.tablet=true;
    getData();
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.h,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage("images/tariq.jpg"),
                width: 75.w,
                height: 60.h,
              ),
              SizedBox(height: 30.h),
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Tap to Continue',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  )
                ],
                isRepeatingAnimation: true,
                onTap: () async {
                  await Future.delayed(Duration(seconds: 2));
                  if (go) {
                    if (DBHelper.designs.isNotEmpty) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DesignsScreen(DBHelper.designs, false);
                      }));
                    } else {
                      await showDialog(
                        context: context,
                        builder: (context) => new AlertDialog(
                          backgroundColor: Colors.white,
                          title: const Text('No Internet Connection'),
                          content: const Text(
                              'Please Check your Internet Connection and Try again.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const StartScreen();
                    }));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}