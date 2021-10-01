import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tariq_al_raqi/db_helper.dart';
import 'package:tariq_al_raqi/screens/designs_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _auth = FirebaseAuth.instance;
  String _email = "";
  String _pass = "";
  bool _wrongInfo = false;

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
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
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
                _email = value;
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
              onChanged: (value) {
                _pass = value;
              },
            ),
            SizedBox(height: 20.0),
            if (_wrongInfo)
              Text(
                "Wrong username and Password \n\t\t               Try again",
                style: TextStyle(
                    color: Colors.red, fontSize: 18.0, fontFamily: 'Lato'),
              ),
            SizedBox(
              height: 150,
            ),
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
                  _wrongInfo = true;
                });
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
// if (_email != "" && _pass != "") {
// await _auth.signInWithEmailAndPassword(
// email: _email, password: _pass);
// if (_auth.currentUser != null)
// Navigator.push(context,
// MaterialPageRoute(builder: (context) {
// return DesignsScreen(DBHelper.designs, false);
// }));
// }
