import 'dart:io';
import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tariq_al_raqi/classes/constants.dart';
import 'package:tariq_al_raqi/classes/designs.dart';
import 'package:tariq_al_raqi/screens/house_screen.dart';
import 'package:tariq_al_raqi/screens/start_screen.dart';
import 'filter_screen.dart';

class DesignsScreen extends StatefulWidget {
  final List<Design> _designs;

  DesignsScreen(this._designs, this.guest);

  final bool guest;

  @override
  _DesignsScreenState createState() => _DesignsScreenState();
}

class _DesignsScreenState extends State<DesignsScreen> {
  List<Widget> designCards = [];

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            backgroundColor: Colors.black,
            title: const Text(
              'Are you sure?',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'Do you want to exit an App',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => exit(0),
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  void fillList() {
    for (int i = 0; i < widget._designs.length; i++) {
      Widget c = HouseItem(widget._designs[i]);
      designCards.add(c);
    }
  }

  @override
  Widget build(BuildContext context) {
    fillList();
    print(widget._designs.length);

    return widget._designs.length > 0
        ? (WillPopScope(
            onWillPop: widget.guest ? null : _onWillPop,
            child: Scaffold(
              appBar: widget.guest
                  ? AppBar(
                      backgroundColor: Colors.black,
                      leading: IconButton(
                        icon: Icon(FontAwesomeIcons.arrowLeft),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  : null,
              backgroundColor: Constants.backgroundColor,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      itemExtent: 180,
                      children: designCards,
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                  if (widget.guest)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15.0),
                      child: GestureDetector(
                        child: Center(
                          child: const Text(
                            "For more options and Designs\n \nSign Up",
                            style:
                                TextStyle(fontSize: 23.0, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const StartScreen();
                          }));
                        },
                      ),
                    )
                ],
              ),
              floatingActionButton: !widget.guest
                  ? FloatingActionButton(
                      backgroundColor: Colors.black,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FilterScreen();
                        }));
                      },
                      child: Icon(
                        FontAwesomeIcons.filter,
                        color: Constants.roqiColor,
                      ),
                    )
                  : null,
            ),
          ))
        : AlertDialog(
            backgroundColor: Colors.black,
            title: const Text('No Internet Connection'),
            content: const Text(
                'Please Check your Internet Connection\n and Try again.'),
            actions: <Widget>[
                TextButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: const Text('Ok'),
                ),
              ]);
  }
}

class HouseItem extends StatelessWidget {
  HouseItem(this.design);

  final f = NumberFormat("#,###,###.#");
  final Design design;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: Duration(milliseconds: 550),
      closedColor: Constants.backgroundColor,
      openColor: Constants.backgroundColor,
      middleColor: Constants.backgroundColor,
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder:
          (BuildContext context, void Function({Object? returnValue}) action) {
        return HouseScreen(house: design);
      },
      closedBuilder: (BuildContext context, void Function() action) {
        return Padding(
          padding: EdgeInsets.all(1.0),
          child: Row(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                width: 140,
                fit: BoxFit.fill,
                height: 140,
                imageUrl: design.url,
                placeholder: (context, url) => LoadingIndicator(
                    indicatorType: Indicator.ballClipRotateMultiple,
                    colors: const [Constants.roqiColor],
                    strokeWidth: 2,
                    backgroundColor: Colors.black,
                    pathBackgroundColor: Colors.black),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Text(
                    "  AED  ${f.format(design.price)}",
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lato',
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
                        title: Text("${design.bedroom}",
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
                          child: Text("${design.bathroom}",
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
                        title: Text("${design.majls}",
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
                          "  ${design.store}",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        );
      },
    );
  }
}
