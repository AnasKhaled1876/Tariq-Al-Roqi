import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tariq_al_raqi/classes/constants.dart';
import 'package:tariq_al_raqi/classes/designs.dart';

class HouseScreen extends StatelessWidget {
  const HouseScreen({Key? key, required this.house}) : super(key: key);

  final Design house;

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
            "${house.type}",
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
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    imageUrl: house.url,
                    placeholder: (context, url) => LoadingIndicator(
                        indicatorType: Indicator.ballClipRotateMultiple,
                        colors: const [Constants.roqi],
                        strokeWidth: 2,
                        backgroundColor: Colors.black,
                        pathBackgroundColor: Colors.black),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
                child: Text("Description",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white),
                    textAlign: TextAlign.start),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.bed,
                      size: 25.0,
                      color: Colors.white,
                    ),
                    Text(
                      "${house.bedroom} Bedrooms",
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
                      "${house.bathroom} Bathrooms",
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
                      "    ${house.living} Living Room",
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
                      "  ${house.dining} Dining Room",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "As we appreciate our customers\n And our only aim is your comfort and happiness\n we present to you the most elegant designs\n "
                  "using the latest building technologies BIM to save a lot of money, effort ,and time.",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
              ),
              const ContactButton()
            ],
          ),
        ),
      )),
    );
  }
}
