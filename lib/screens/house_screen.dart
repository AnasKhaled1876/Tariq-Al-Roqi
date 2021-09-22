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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          margin: EdgeInsets.all(85.0),
          child: Text(
            "Type ${house.type}",
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CachedNetworkImage(fit: BoxFit.fill,
                  width: 350,
                  height: 300,
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
              Text(
                "\nThe Finest Designs.\n With the Best Equipment\n and The Highest Quality you can find.\n from the Design to The Key\n with bank facilities and accommodation.\nYour Highway to Paradise",
                style: TextStyle(
                    fontFamily: 'Lato',
                    wordSpacing: 2,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Description",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.black),
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
                      color: Colors.black,
                    ),
                    Text(
                      "${house.bedroom} Bedrooms",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Icon(
                      FontAwesomeIcons.bath,
                      size: 25.0,
                      color: Colors.black,
                    ),
                    Text(
                      "${house.bathroom} Bathrooms",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.couch,
                      size: 25.0,
                      color: Colors.black,
                    ),
                    Text(
                      "    ${house.living} Living Room",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Icon(
                      FontAwesomeIcons.chair,
                      size: 25.0,
                      color: Colors.black,
                    ),
                    Text(
                      "  ${house.dining} Dining Room",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ContactButton(
                      buttonText: 'Message',
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: ContactButton(
                      buttonText: '  Call',
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
