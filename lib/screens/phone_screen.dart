import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
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
  bool _wrongNumber = false;

  Future<void> _failMessage() async {
    await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('No Internet Connection'),
        content:
        const Text('Something went wrong\n Try again please.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {Navigator.pop(context);},
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
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
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Enter Your Mobile Number",
                style: TextStyle(fontFamily: "Lato", fontSize: 20.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 80.w,
                margin: EdgeInsets.only(bottom: 15.0),
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
              if (_wrongNumber)
                Text(
                  "Please Enter a valid Number",
                  style: TextStyle(color: Colors.red, fontSize: 14.sp,fontFamily: 'Lato'),
                ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: Size(double.infinity, 8.h),
                  ),
                  onPressed: () async {
                    if (_phone.toString().length != 13)
                      setState(() {
                        _wrongNumber = true;
                      });
                    else {
                      setState(() {
                        _wrongNumber = false;
                        loading = true;
                      });
                      await _auth.verifyPhoneNumber(
                          timeout: const Duration(seconds: 100),
                          phoneNumber: _phone,
                          verificationCompleted: (phoneAuthCredential) async {},
                          verificationFailed: (verificationFailed) async {
                            print(verificationFailed.message.toString());
                            await _failMessage();
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
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Lato",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              if (loading) CircularProgressIndicator(),
              SizedBox(height: 3.h),
            ],
          ),
        ));
  }
}
