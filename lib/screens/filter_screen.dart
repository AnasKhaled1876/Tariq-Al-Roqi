import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:tariq_al_raqi/classes/designs.dart';
import 'package:tariq_al_raqi/classes/row_cards.dart';
import 'package:tariq_al_raqi/db_helper.dart';
import 'designs_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  final f = NumberFormat("#,###,###.#");
  Color _raqi = Color.fromRGBO(234, 181, 101, 1.0);
  int min = 800000;
  int max = 2500000;
  var selectedRange = RangeValues(800000, 2500000);
  List<Color> bedRoomCardColor = [];
  List<Color> bathCardColor = [];
  List<Design> _designs = [];
  var bed=0, bath=0;

  List<Design> filteredDesigns() {
    for (int i = 0; i < DBHelper.designs.length; i++) {
      if (min <= DBHelper.designs[i].price && max >= DBHelper.designs[i].price) {
        if(bath!=0 && bed!=0) {
          if (bed == DBHelper.designs[i].bedroom &&
              bath == DBHelper.designs[i].bathroom)
            _designs.add(DBHelper.designs[i]);
        }
        else if(bath==0 && bed!=0){
          if(bed==DBHelper.designs[i].bedroom)
          _designs.add(DBHelper.designs[i]);
        }
        else if(bath!=0 && bed==0){
          if(bath==DBHelper.designs[i].bathroom)
            _designs.add(DBHelper.designs[i]);
        }
        else{
          _designs.add(DBHelper.designs[i]);
        }
      }
    }
    return _designs;
  }

  void fillCardsAndColors() {
    for (int i = 0; i < 5; i++) {
      bedRoomCardColor.add(Colors.white);
      bathCardColor.add(Colors.white);
    }
  }

  void selectedCard(String label) {
    if (label == "bed") {
      for (int i = 0; i < 5; i++) {
        if (bedRoomCardColor[i] == _raqi) bedRoomCardColor[i] = Colors.white;
      }
    } else {
      for (int i = 0; i < 5; i++) {
        if (bathCardColor[i] == _raqi) bathCardColor[i] = Colors.white;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fillCardsAndColors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
            size: 30.0,
          ),
        ),
        title: Container(margin: EdgeInsets.only(left: 5.w),
          child: Text(
            "Filter",textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 3.h, left: 6.w),
            child: Text("Design",
                style: TextStyle(
                  fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: Colors.black)),
          ),
          Container(
            margin: EdgeInsets.only(left: 6.w, top: 1.h),
            child: Text(
              "your Home",
              style: TextStyle(fontFamily: 'Lato',fontSize: 20.sp, color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3.h,right: 3.w),
            alignment: Alignment.topRight,
            child: Text(
              "${f.format(min)} - ${f.format(max)}",
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.h),
            child: SliderTheme(
              data: SliderThemeData(
                inactiveTrackColor: Colors.grey,
                overlayColor: Colors.blueGrey,
                thumbColor: _raqi,
                activeTrackColor: Colors.black,
              ),
              child: RangeSlider(
                values: selectedRange,
                onChanged: (RangeValues newValues) {
                  setState(() {
                    selectedRange = newValues;
                    min = newValues.start.toInt();
                    max = newValues.end.toInt();
                  });
                },
                max: 2500000,
                min: 800000,
                labels: RangeLabels(
                    '${selectedRange.start}', '${selectedRange.end}'),
              ),
            ),
          ),
          RoomLabel("Bedrooms"),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h,horizontal: 3.w),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bed");
                      bedRoomCardColor[0] = _raqi;
                      bed = 0;
                    });
                  },
                  child: BoxContain("Any", bedRoomCardColor[0]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bed");
                      bedRoomCardColor[1] = _raqi;
                      bed = 4;
                    });
                  },
                  child: BoxContain("4", bedRoomCardColor[1]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bed");
                      bedRoomCardColor[2] = _raqi;
                      bed = 5;
                    });
                  },
                  child: BoxContain("5", bedRoomCardColor[2]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bed");
                      bedRoomCardColor[3] = _raqi;
                      bed = 6;
                    });
                  },
                  child: BoxContain("6", bedRoomCardColor[3]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bed");
                      bedRoomCardColor[4] = _raqi;
                      bed = 7;
                    });
                  },
                  child: BoxContain("7", bedRoomCardColor[4]),
                ),
              ],
            ),
          ),
          RoomLabel("Bathrooms"),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h,horizontal: 3.w),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bath");
                      bathCardColor[0] = _raqi;
                      bath = 0;
                    });
                  },
                  child: BoxContain("Any", bathCardColor[0]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bath");
                      bathCardColor[1] = _raqi;
                      bath = 6;
                    });
                  },
                  child: BoxContain("6", bathCardColor[1]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bath");
                      bathCardColor[2] = _raqi;
                      bath = 7;
                    });
                  },
                  child: BoxContain("7", bathCardColor[2]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bath");
                      bathCardColor[3] = _raqi;
                      bath = 8;
                    });
                  },
                  child: BoxContain("8", bathCardColor[3]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bath");
                      bathCardColor[4] = _raqi;
                      bath = 9;
                    });
                  },
                  child: BoxContain("9", bathCardColor[4]),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DesignsScreen(DBHelper.designs,false);
                        }));
                      });
                    },
                    child: Container(
                      height: 8.h,
                      child: Card(
                        color: Colors.white,
                        elevation: 5.0,
                        child: Center(
                          child: Text(
                            "Show all Designs",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if(_designs.isNotEmpty)
                          _designs.clear();
                        filteredDesigns();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DesignsScreen( _designs,false);
                        }));
                      });
                    },
                    child: Container(
                      height: 8.h,
                      child: Card(
                        color: Colors.black,
                        elevation: 5.0,
                        child: Center(
                          widthFactor: double.infinity,
                          child: Text(
                            "Filter",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: _raqi,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
