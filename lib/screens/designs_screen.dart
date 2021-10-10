import 'dart:io';
import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sizer/sizer.dart';
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
            backgroundColor: Colors.white,
            title: const Text(
              'Are you sure?',
              style: TextStyle(color: Colors.black),
            ),
            content: const Text(
              'Do you want to exit ?',
              style: TextStyle(color: Colors.black),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => exit(0),
                child: const Text(
                  'Yes',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.black),
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
                      itemExtent: 25.h,
                      children: designCards,
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                  if (widget.guest)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 3.h),
                      child: GestureDetector(
                        child: Center(
                          child: Text(
                            "For more options and Designs\n \nSign Up",
                            style:
                                TextStyle(fontSize: 18.sp, color: Colors.white),
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
            backgroundColor: Colors.white,
            title: const Text('No Results found'),
            content: const Text(
                'Try different features.'),
            actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return FilterScreen();
                        }));
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
                width: 43.w,
                fit: BoxFit.fill,
                height: 22.h,
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
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Lato',
                        color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 10.h,
                      width: 25.w,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.bed,
                          color: Colors.white,
                        ),
                        title: Text("${design.bedroom}",
                            style:
                                TextStyle(fontSize: 13.sp, color: Colors.white)),
                      ),
                    ),
                    Container(
                      width: 28.w,
                      height: 10.5.h,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.bath,
                          color: Colors.white,
                        ),
                        title: Center(
                          child: Text("${design.bathroom}",textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 25.w,
                      height: 10.h,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.couch,
                          color: Colors.white,
                        ),
                        title: Text("${design.living}",
                            style:
                                TextStyle(fontSize: 13.sp, color: Colors.white)),
                      ),
                    ),
                    Container(
                      height: 10.5.h,
                      width: 25.w,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.warehouse,
                          color: Colors.white,
                        ),
                        title: Text(
                          "  ${design.store}",
                          style: TextStyle(fontSize: 13.sp, color: Colors.white),
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
