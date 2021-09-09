import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tariq_al_raqi/classes/designs.dart';

class HouseScreen extends StatefulWidget {
  HouseScreen(this.house);

  final Design house;

  @override
  _HouseScreenState createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            "${widget.house.type}",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Center(
          child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Image(
                    image: NetworkImage(widget.house.url),
                  ),
                ),
              ),
              Container(margin: EdgeInsets.only(top: 15.0),
                child: Expanded(
                  child: Text("Description",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                      textAlign: TextAlign.start),
                  flex: 1,
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          leading: Icon(FontAwesomeIcons.bed),
                          title: Text(
                            "${widget.house.bedroom} Bedrooms",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Icon(FontAwesomeIcons.bath),
                          title: Text("${widget.house.bathroom} Bathrooms",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
//
// ,
