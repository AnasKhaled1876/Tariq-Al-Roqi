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
  bool _wrongCode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Spacer(),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Verification Code",
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              maxLines: 1,
              onChanged: (value) {
                userCode = value;
              },
            ),
            if (_wrongCode)
              Text(
                "Wrong verification code \n     Enter a valid code",
                style: TextStyle(
                    color: Colors.red, fontSize: 18.0, fontFamily: 'Lato'),
              ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
              onPressed: () async {
                Future<String> tok = _auth.currentUser!.getIdToken(false);
                print(tok);
                if (userCode != "") {
                  setState(() {
                    _wrongCode = false;
                    loading = true;
                  });
                  final phoneAuthCredential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId, smsCode: userCode);
                  try {
                    final authCredential =
                        await _auth.signInWithCredential(phoneAuthCredential);
                    if (authCredential.user != null) {
                      DBHelper().signConfirmed();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DesignsScreen(DBHelper.designs, false);
                      }));
                    }
                    else {
                      setState(() {
                        _wrongCode=true;
                      });
                    }
                  } catch (e) {
                    setState(() {
                      _wrongCode = true;
                    });
                  }
                } else {
                  setState(() {
                    _wrongCode = true;
                  });
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
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
