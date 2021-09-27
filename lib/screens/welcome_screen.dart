import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tariq_al_raqi/db_helper.dart';
import 'package:tariq_al_raqi/screens/start_screen.dart';
import 'designs_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final DBHelper _dbHelper = DBHelper();
  static bool go=false;
  static const colorizeColors = [
    Color.fromRGBO(234, 181, 101, 1.0),
    Colors.black12,
  ];

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
            padding: const EdgeInsets.all(8.0),
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
                      if(go){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return DesignsScreen(DBHelper.designs, false);
                            }));
                      }
                      else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const StartScreen();
                            }));
                      }
                    },
                    child: Text('       Your House \n On Your Own Terms',
                        style: TextStyle(
                          fontFamily:'Lato',
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(234, 181, 101, 1.0),
                        )),
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