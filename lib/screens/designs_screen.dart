import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tariq_al_raqi/classes/designs.dart';
import 'package:tariq_al_raqi/db_helper.dart';
import 'package:tariq_al_raqi/screens/house_screen.dart';

import 'filter_screen.dart';

class DesignsScreen extends StatefulWidget {
  const DesignsScreen({Key? key}) : super(key: key);

  @override
  _DesignsScreenState createState() => _DesignsScreenState();
}

class _DesignsScreenState extends State<DesignsScreen> {
  List<Widget> designCards = [];

  dynamic pass(Design design) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HouseScreen(design);
    }));
  }

  void fillList() {
    for (int i = 0; i < DBHelper.designs.length; i++) {
      Widget c = GestureDetector(
        onTap: () {
          setState(() {
            pass(DBHelper.designs[i]);
          });
        },
        child: Card(
          child: ListTile(
              leading: Image(
                image: NetworkImage(DBHelper.designs[i].url),
                width: 100.0,
                height: 100.0,
              ),
              title: Text(
                "${DBHelper.designs[i].price}",
                style: TextStyle(fontSize: 40.0),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      leading: Icon(FontAwesomeIcons.bed),
                      title: Text("${DBHelper.designs[i].bedroom}",
                          style: TextStyle(fontSize: 20.0)),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: Icon(FontAwesomeIcons.bath),
                      title: Text("${DBHelper.designs[i].bathroom}",
                          style: TextStyle(fontSize: 20.0)),
                    ),
                  )
                ],
              )),
        ),
      );
      designCards.add(c);
    }
  }

  @override
  Widget build(BuildContext context) {
    fillList();
    print(DBHelper.designs.length);
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: designCards,
          scrollDirection: Axis.vertical,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FilterScreen();
            }));
          },
          child: Icon(FontAwesomeIcons.calculator),
        ),
      ),
    );
  }
}
