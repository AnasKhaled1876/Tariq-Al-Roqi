import 'dart:io';

import 'package:flutter/material.dart';
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
              SizedBox(height: 70.0),
              const Text(
                "A Paradise of Your Making",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0, color: Colors.white, fontFamily: "Lato"),
              ),
              Spacer(),
              Image.asset("images/logo.jpg"),
              Spacer(),
              Expanded(
                child: Row(
                  children: <Widget>[
                    SignButton(
                      path: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SigninScreen();
                        }));
                      },
                      signText: "Commercial",
                    ),
                    SizedBox(width: 10.0),
                    SignButton(
                        path: () {
                          if (DBHelper.designs.length > 0)
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DesignsScreen(
                                    DBHelper.designs.sublist(0, 3), true);
                              }),
                            );
                          else
                            setState(() {
                              AlertDialog(
                                  backgroundColor: Colors.black,
                                  title: const Text('No Internet Connection'),
                                  content: const Text(
                                      'Please Check your Internet Connection\n and Try again.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        exit(0);
                                      },
                                      child: const Text('Ok'),
                                    ),
                                  ]);
                            });
                        },
                        signText: "Sign as Guest"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 5.0),
                child: const Text(
                  "Don't have an Account?",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
              GestureDetector(
                child: const Text(
                  "Sign up",
                  style: TextStyle(fontSize: 30.0, color: Colors.amber),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PhoneScreen();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
