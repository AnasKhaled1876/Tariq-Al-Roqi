import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tariq_al_raqi/db_helper.dart';
import 'package:tariq_al_raqi/screens/verifying_screen.dart';

import 'designs_screen.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  dynamic _phone;
  final _auth = FirebaseAuth.instance;
  String verificationID = "";
  bool loading = false;
  String userCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Spacer(),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Phone Number",
          ),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.phone,
          maxLines: 1,
          onChanged: (value) {
            _phone = value;
          },
        ),
        Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () async {
            setState(() {
              loading = true;
            });
            await _auth.verifyPhoneNumber(
              timeout: const Duration(seconds: 100),
                phoneNumber: _phone,
                verificationCompleted: (phoneAuthCredential) async {
                },
                verificationFailed: (verificationFailed) async {
                  print("Nooooooo ${verificationFailed.message}");
                },
                codeSent: (verificationID, resendingToken) async {
                  this.verificationID = verificationID;
                  print('verification id is $verificationID');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VerifyingScreen(verificationId: verificationID);
                  }));
                },
                codeAutoRetrievalTimeout: (verificationID) {
                this.verificationID=verificationID;
                });
          },
          child: Text(
            "Send Verification Code",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        if (loading) CircularProgressIndicator(),
      ],
    ));
  }
}
