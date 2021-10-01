import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tariq_al_raqi/db_helper.dart';
import 'package:tariq_al_raqi/screens/start_screen.dart';

import 'designs_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final DBHelper _dbHelper = DBHelper();

  static bool go = false;
  static const colorizeColors = [
    Color(0xffF6D06E),
    Color(0xff856220),
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 35.0,
//fontFamily: 'Lato',
  );

  static final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffF6D06E), Color(0xff856220)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

  void getData() async {
    await _dbHelper.getDesigns();
    go = await DBHelper().checkSigned();
  }

  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image(
                    image: AssetImage("images/tariq.jpg"),
                  ),
                  flex: 4,
                ),
                // Center(
                //   child: GestureDetector(
                //     onTap: () {
                //       if (go) {
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) {
                //           return DesignsScreen(DBHelper.designs, false);
                //         }));
                //       } else {
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) {
                //           return const StartScreen();
                //         }));
                //       }
                //     },
                //     child: Text(
                //       '       Your House \n On Your Own Terms',
                //       style: TextStyle(
                //         fontFamily: 'Lato',
                //         fontSize: 35.0,
                //         foreground: Paint()..shader = linearGradient,
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 60.0),
                  Expanded(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'Press to Continue',
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        )
                      ],
                      isRepeatingAnimation: true,
                      onTap: () {
                        if (go) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return DesignsScreen(DBHelper.designs, false);
                              }));
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return const StartScreen();
                              }));
                        }
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
