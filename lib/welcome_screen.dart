import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Image(
              image: AssetImage("images/logo.jpg"),
            ),
              flex: 9,
            ),
            Expanded(
              child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse, /// Required, The loading type of the widget
                  colors: const [Colors.white],       /// Optional, The color collections
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
