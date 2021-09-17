import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

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
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              onEditingComplete: () {},
            ),
            SizedBox(height: 25.0),
            TextField(
              controller: _passController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
              ),
              textInputAction: TextInputAction.done,
              obscureText: true,
              maxLines: 1,
              onEditingComplete: () {},
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
              onPressed: () {},
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
