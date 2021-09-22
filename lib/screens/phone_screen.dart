import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tariq_al_raqi/screens/verifying_screen.dart';

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
        appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0,),
              Text(
                "Enter Your Mobile Number",
                style: TextStyle(fontFamily: "Lato", fontSize: 20.0),
              textAlign: TextAlign.center,),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "+971 55 1234567",
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  maxLines: 1,
                  onChanged: (value) {
                    _phone = value;
                  },
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: Size(double.infinity, 50),

                  ),
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    await _auth.verifyPhoneNumber(
                        timeout: const Duration(seconds: 100),
                        phoneNumber: _phone,
                        verificationCompleted: (phoneAuthCredential) async {},
                        verificationFailed: (verificationFailed) async {
                          print("Nooooooo ${verificationFailed.message}");
                        },
                        codeSent: (verificationID, resendingToken) async {
                          this.verificationID = verificationID;
                          print('verification id is $verificationID');
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return VerifyingScreen(
                                verificationId: verificationID);
                          }));
                        },
                        codeAutoRetrievalTimeout: (verificationID) {
                          this.verificationID = verificationID;
                        });
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Lato",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              if (loading) CircularProgressIndicator(),
              SizedBox(height: 25.0),
            ],
          ),
        ));
  }
}
