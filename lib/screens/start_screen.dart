import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tariq_al_raqi/classes/constants.dart';
import 'package:tariq_al_raqi/db_helper.dart';
import 'package:tariq_al_raqi/screens/designs_screen.dart';
import 'package:tariq_al_raqi/screens/phone_screen.dart';
import 'package:tariq_al_raqi/screens/signin_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  static final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffF5D78B), Color(0xff856220)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 20.0, 70.0));

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  Future<void> _noInternetMessage() async {
    await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('No Internet Connection'),
        content:
            const Text('Please Check your Internet Connection and Try again.'),
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 5.h),
              Text(
                "Welcome to Tariq Al Roqi\n Your Service is Our Concern",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Color(0xffF6D06E),
                    fontFamily: "Lato"),
              ),
              SizedBox(
                height: 5.h,
              ),
              Image.asset(
                "images/logo.jpg",
                height: 35.h,
                width: 60.w,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 5.h,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: SignButton(
                        path: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PhoneScreen();
                          }));
                        },
                        signText: "Residential",
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      width: double.infinity,
                      child: SignButton(
                          path: () async {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SigninScreen();
                            }));
                          },
                          signText: "Commercial"),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Text(
                  "Sign in as Guest",
                  style: TextStyle(
                      fontSize: 19.sp,
                      foreground: Paint()..shader = linearGradient),
                ),
                onTap: () async {
                  final _auth = FirebaseAuth.instance;
                  await _auth.signInAnonymously();
                  await DBHelper().getDesigns();
                  if (DBHelper.designs.length > 0)
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return DesignsScreen(
                            DBHelper.designs.sublist(0, 3), true);
                      }),
                    );
                  else
                    await _noInternetMessage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
