import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tariq_al_raqi/classes/designs.dart';
import 'package:url_launcher/url_launcher.dart';

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
        title: Container(
          margin: EdgeInsets.all(92.0),
          child: Text(
            "${widget.house.type}",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Center(
          child: Container(
        color: Color(0xff2c2c2c),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: NetworkImage(widget.house.url),
                  ),
                ),
              ),
              Container(alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 15.0,bottom: 10.0),
                child: Text("Description",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white),
                    textAlign: TextAlign.start),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.bed,
                      size: 25.0,
                      color: Colors.white,
                    ),
                    Text(
                      "${widget.house.bedroom} Bedrooms",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Icon(
                      FontAwesomeIcons.bath,
                      size: 25.0,
                      color: Colors.white,
                    ),
                    Text(
                      "${widget.house.bathroom} Bathrooms",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.couch,
                      size: 25.0,
                      color: Colors.white,
                    ),
                    Text(
                      "    ${widget.house.living} Living Room",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Icon(
                      FontAwesomeIcons.chair,
                      size: 25.0,
                      color: Colors.white,
                    ),
                    Text(
                      "  ${widget.house.dining} Dining Room",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1,
                child: Text(
                  "As we appreciate our customers\n And our only aim is your comfort and happiness\n we present to you the most elegant designs\n "
                  "using the latest building technologies BIM to save a lot of money, effort ,and time.",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize:Size(double.infinity, 30.0),primary: Colors.black),
                onPressed: () {
                  setState(() {
                    launch("tel://+971585556767");
                  });
                },
                child: Text(
                  "Contact our Office",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
