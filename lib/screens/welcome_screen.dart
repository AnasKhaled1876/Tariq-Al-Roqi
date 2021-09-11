import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tariq_al_raqi/db_helper.dart';
import 'package:tariq_al_raqi/screens/designs_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final DBHelper _dbHelper = DBHelper();

  static const colorizeColors = [
    Colors.white,
    Colors.yellow,
    Color.fromRGBO(234, 181, 101, 1.0),
    Colors.black,
  ];

  void getData() async{
    await _dbHelper.getDesigns();
  }

  Widget build(BuildContext context) {
    getData();
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
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DesignsScreen(DBHelper.designs);
                    }));
                  },
                  child:AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'Your House',
                        textStyle: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(234, 181, 101, 1.0),
                        ),
                        colors: colorizeColors,
                      ),
                      ColorizeAnimatedText(
                        'On Your Own Terms',
                        textStyle: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(234, 181, 101, 1.0),
                        ),
                        colors: colorizeColors,
                      ),
                    ],
                    isRepeatingAnimation: true,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return DesignsScreen(DBHelper.designs);
                        }));
                      }
                  ),
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

// Icon(
// Ionicons.arrow_forward_circle_outline,
// color: Color.fromRGBO(234, 181, 101, 1.0),
// size: 40.0,
// )