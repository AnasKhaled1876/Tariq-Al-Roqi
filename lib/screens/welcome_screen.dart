import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tariq_al_raqi/db_helper.dart';
import 'package:tariq_al_raqi/screens/designs_screen.dart';
import 'package:tariq_al_raqi/screens/filter_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final DBHelper _dbHelper = DBHelper();

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
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DesignsScreen();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "       Your House \nOn Your Own Terms",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(234, 181, 101, 1.0),
                      ),
                    ),
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

// Icon(
// Ionicons.arrow_forward_circle_outline,
// color: Color.fromRGBO(234, 181, 101, 1.0),
// size: 40.0,
// )
