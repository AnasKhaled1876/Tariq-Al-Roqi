import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tariq_al_raqi/designs_screen.dart';
import 'package:tariq_al_raqi/row_cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tariq_al_raqi/welcome_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Color raqi = Color.fromRGBO(234, 181, 101, 1.0);
  int min = 800000;
  int max = 2000000;
  var selectedRange = RangeValues(800000, 2000000);
  List<Color> bedRoomCardColor = [];
  List<Color> bathCardColor = [];

  void fillCardsAndColors() {
    for (int i = 0; i < 5; i++) {
      bedRoomCardColor.add(Colors.white);
      bathCardColor.add(Colors.white);
    }
  }

  void selectedCard(String label) {
    if (label == "bed") {
      for (int i = 0; i < 5; i++) {
        if (bedRoomCardColor[i] == raqi) bedRoomCardColor[i] = Colors.white;
      }
    } else {
      for (int i = 0; i < 5; i++) {
        if (bathCardColor[i] == raqi) bathCardColor[i] = Colors.white;
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
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WelcomeScreen();
                    }));
                  },
                  icon: Icon(
                    FontAwesomeIcons.times,
                    color: Colors.black,
                    size: 40.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0, top: 30.0, left: 115.0),
                child: Text(
                  "Filter",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0, left: 20.0),
            child: Text("Design",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.black)),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 5.0),
            child: Text(
              "your Home",
              style: TextStyle(fontSize: 30.0, color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            alignment: Alignment.topRight,
            child: Text(
              "$min - $max",
              style: TextStyle(fontSize: 25.0, color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: SliderTheme(
              data: SliderThemeData(
                thumbColor: raqi,
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
                max: 2000000,
                min: 800000,
                labels: RangeLabels(
                    '${selectedRange.start}', '${selectedRange.end}'),
                divisions: 4,
              ),
            ),
          ),
          RoomLabel("Bedrooms"),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bed");
                      bedRoomCardColor[0] = raqi;
                    });
                  },
                  child: BoxContain("Any", bedRoomCardColor[0]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bed");
                      bedRoomCardColor[1] = raqi;
                    });
                  },
                  child: BoxContain("4", bedRoomCardColor[1]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bed");
                      bedRoomCardColor[2] = raqi;
                    });
                  },
                  child: BoxContain("5", bedRoomCardColor[2]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bed");
                      bedRoomCardColor[3] = raqi;
                    });
                  },
                  child: BoxContain("6", bedRoomCardColor[3]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bed");
                      bedRoomCardColor[4] = raqi;
                    });
                  },
                  child: BoxContain("7", bedRoomCardColor[4]),
                ),
              ],
            ),
          ),
          RoomLabel("Bathrooms"),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bath");
                      bathCardColor[0] = raqi;
                    });
                  },
                  child: BoxContain("Any", bathCardColor[0]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bath");
                      bathCardColor[1] = raqi;
                    });
                  },
                  child: BoxContain("6", bathCardColor[1]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bath");
                      bathCardColor[2] = raqi;
                    });
                  },
                  child: BoxContain("7", bathCardColor[2]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bath");
                      bathCardColor[3] = raqi;
                    });
                  },
                  child: BoxContain("8", bathCardColor[3]),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCard("bath");
                      bathCardColor[4] = raqi;
                    });
                  },
                  child: BoxContain("9", bathCardColor[4]),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return DesignsScreen();
                    }));
              });
            },
            child: Card(margin: EdgeInsets.only(top: 120.0,left:30.0,right: 30.0),
              color: raqi,
              elevation: 5.0,
              child: Center(
                child: Text(
                  "Show Design",
                  style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
