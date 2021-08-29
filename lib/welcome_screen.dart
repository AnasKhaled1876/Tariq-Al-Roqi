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
              image: AssetImage("images/tariq.jpg"),
            ),
              flex: 7,
            ),
            Expanded(
              child: LoadingIndicator(
                  indicatorType: Indicator.ballBeat, /// Required, The loading type of the widget
                  colors: const [Color.fromRGBO(234, 181, 101, 1.0)],       /// Optional, The color collections
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
