import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tariq_al_raqi/classes/designs.dart';
import 'package:tariq_al_raqi/screens/house_screen.dart';
import 'filter_screen.dart';

class DesignsScreen extends StatefulWidget {
  final List<Design> _designs;

  DesignsScreen(this._designs);

  @override
  _DesignsScreenState createState() => _DesignsScreenState();
}

class _DesignsScreenState extends State<DesignsScreen> {
  List<Widget> designCards = [];
  var f = NumberFormat("#,###,###.0#");

  dynamic pass(Design design) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HouseScreen(design);
    }));
  }

  void fillList() {
    for (int i = 0; i < widget._designs.length; i++) {
      Widget c = Padding(
        padding: EdgeInsets.all(9.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              pass(widget._designs[i]);
            });
          },
          child: Row(children: <Widget>[
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: NetworkImage(widget._designs[i].url),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Text(
                    "  AED  ${f.format(widget._designs[i].price)}",
                    style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      width: 90.0,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.bed,
                          color: Colors.white,
                        ),
                        title: Text("${widget._designs[i].bedroom}",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white)),
                      ),
                    ),
                    Container(
                      width: 120.0,
                      height: 60.0,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.bath,
                          color: Colors.white,
                        ),
                        title: Center(
                          child: Text("${widget._designs[i].bathroom}",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 90.0,
                      height: 60.0,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.couch,
                          color: Colors.white,
                        ),
                        title: Text("${widget._designs[i].majls}",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white)),
                      ),
                    ),
                    Container(
                      height: 60.0,
                      width: 120.0,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.warehouse,
                          color: Colors.white,
                        ),
                        title: Text(
                          "  ${widget._designs[i].store}",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      );
      designCards.add(c);
    }
  }

  @override
  Widget build(BuildContext context) {
    fillList();
    print(widget._designs.length);
    return Scaffold(
      backgroundColor: Color(0xff2c2c2c),
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
        child: Icon(FontAwesomeIcons.filter),
      ),
    );
  }
}
