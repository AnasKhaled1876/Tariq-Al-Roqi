import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../db_helper.dart';
import 'designs_screen.dart';

class VerifyingScreen extends StatefulWidget {
  final verificationId;

  const VerifyingScreen({Key? key, this.verificationId}) : super(key: key);

  @override
  _VerifyingScreenState createState() => _VerifyingScreenState();
}

class _VerifyingScreenState extends State<VerifyingScreen> {
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  String userCode = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Password",
          ),
          textInputAction: TextInputAction.next,
          obscureText: true,
          maxLines: 1,
          onChanged: (value) {
            userCode = value;
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
            final phoneAuthCredential = PhoneAuthProvider.credential(
                verificationId: widget.verificationId, smsCode: userCode);
            try {
              final authCredential =
                  await _auth.signInWithCredential(phoneAuthCredential);
              if (authCredential.user != null)
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DesignsScreen(DBHelper.designs);
                }));
            } catch (e) {
              print(e);
            }
          },
          child: Text(
            "Next",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        if (loading) CircularProgressIndicator(),
      ],
    );
  }
}