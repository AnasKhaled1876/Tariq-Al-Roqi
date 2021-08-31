import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tariq_al_raqi/filter_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image(
                  image: AssetImage("images/tariq.jpg"),
                ),
                flex: 7,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FilterScreen();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Secure your Home with us  ",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(234, 181, 101, 1.0),
                      ),
                    ),
                    Icon(
                      Ionicons.arrow_forward_circle_outline,
                      color: Color.fromRGBO(234, 181, 101, 1.0),
                      size: 40.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// LoadingIndicator(
// indicatorType: Indicator.ballBeat, /// Required, The loading type of the widget
// colors: const [Color.fromRGBO(234, 181, 101, 1.0)],       /// Optional, The color collections
// )
