import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tariq_al_raqi/db_helper.dart';
import 'package:tariq_al_raqi/screens/designs_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  final _auth = FirebaseAuth.instance;
  String _email="";
  String _pass="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Spacer(),
            Text(
              "Sign in",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 25.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              onChanged: (value) {
                _email=value;
              },
            ),
            SizedBox(height: 25.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
              ),
              textInputAction: TextInputAction.done,
              obscureText: true,
              maxLines: 1,
              onChanged: (value){
               _pass=value;
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
              onPressed: () async{
                if(_email!="" && _pass!="") {
                  await _auth.signInWithEmailAndPassword(
                      email: _email, password: _pass);
                  if(_auth.currentUser != null)
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DesignsScreen(DBHelper.designs);
                    }));
                }
              },
              child: Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}