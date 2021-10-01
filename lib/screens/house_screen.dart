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
          margin: EdgeInsets.only(left: 35.0),
          child: Text(
            "Type ${house.type}",
            style: TextStyle(
                fontSize: 28.0,
                fontFamily: "Lato",
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
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
                "\nThe Finest Designs\n With the Best Equipment\n and The Highest Quality you can find\n from the Design to The Key\n with bank facilities and accommodation\nYour Highway to Paradise",
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
              Container(
                width: double.infinity,
                height: 100,
                child: ListView(
                  itemExtent: 150,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 100,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.bed,
                          color: Colors.amber,
                          size: 25.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "${house.bedroom} \nBedroom",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 100,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.bath,
                          color: Colors.amber,
                          size: 25.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "${house.bathroom} \nBathroom",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 100,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.couch,
                          color: Colors.amber,
                          size: 25.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "${house.living} \nLiving Room",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 100,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.userFriends,
                          color: Colors.amber,
                          size: 25.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "${house.majls} \nMajls",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 100,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.pizzaSlice,
                          color: Colors.amber,
                          size: 25.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "${house.kitchen} \nKitchen",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 100,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.female,
                          color: Colors.amber,
                          size: 25.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "${house.maid} \nMaid Room",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 100,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.doorClosed,
                          color: Colors.amber,
                          size: 25.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "${house.store} \nStorage ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 100,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.chair,
                          color: Colors.amber,
                          size: 25.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Text(
                            "${house.dining} \nDining Room",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(bottom: 15.0),
                child: Row(
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
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

// Padding(
// padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// Icon(
// FontAwesomeIcons.bed,
// size: 25.0,
// color: Colors.black,
// ),
// Text(
// "${house.bedroom} Bedrooms",
// style: TextStyle(
// fontSize: 20.0,
// fontWeight: FontWeight.w400,
// color: Colors.black),
// ),
// Icon(
// FontAwesomeIcons.bath,
// size: 25.0,
// color: Colors.black,
// ),
// Text(
// "${house.bathroom} Bathrooms",
// style: TextStyle(
// fontSize: 20.0,
// fontWeight: FontWeight.w400,
// color: Colors.black),
// ),
// ],
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// Icon(
// FontAwesomeIcons.couch,
// size: 25.0,
// color: Colors.black,
// ),

// Icon(
// FontAwesomeIcons.chair,
// size: 25.0,
// color: Colors.black,
// ),
// Text(
// "  ${house.dining} Dining Room",
// style: TextStyle(
// fontSize: 20.0,
// fontWeight: FontWeight.w400,
// color: Colors.black),
// ),
// ],
// ),
// ),
