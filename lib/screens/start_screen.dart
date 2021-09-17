import 'package:flutter/material.dart';
import 'package:tariq_al_raqi/db_helper.dart';
import 'package:tariq_al_raqi/screens/designs_screen.dart';
import 'package:tariq_al_raqi/screens/signin_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "A Paradise with unlimited Options",textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.white),
            ),
            Text(
              "Build your Lifetime House",
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
            Spacer(),
            Image.asset("images/logo.jpg"),
            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, minimumSize: Size(260.0, 40.0)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DesignsScreen(DBHelper.designs);
                  }));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 30.0, color: Colors.black),
                ),
              ),
            ),
            Container(margin: EdgeInsets.only(top: 20.0,bottom: 5.0),
              child: Text(
                "Already a Member?",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
            GestureDetector(
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 30.0, color: Colors.amber),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SigninScreen();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
