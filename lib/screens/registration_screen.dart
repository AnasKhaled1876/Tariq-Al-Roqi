import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _name="";
  String _email="";
  String _password="";
  String _password2="";
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor:Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            children: <Widget>[
              Expanded(child: Image.asset("images/logo.jpg")),
              Text(
                "Create Account",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                maxLines: 1,
                onChanged: (value){
                  _name=value;
                },
              ),
              SizedBox(height: 15.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                onChanged: (value){
                  _email=value;
                },
              ),
              SizedBox(height: 15.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
                textInputAction: TextInputAction.next,
                obscureText: true,
                maxLines: 1,
                onChanged: (value){
                  _password=value;
                },
              ),
              SizedBox(height: 15.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Confirm Password",
                ),
                textInputAction: TextInputAction.done,
                obscureText: true,
                maxLines: 1,
                onChanged: (value){
                  _password2=value;
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
                  _auth.createUserWithEmailAndPassword(email: _email, password: _password);
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
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
      ),
    );
  }
}
