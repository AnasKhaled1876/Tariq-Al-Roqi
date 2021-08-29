import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int min=800000;
  int max = 2000000;
  var selectedRange = RangeValues(800000, 2000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          Container(margin: EdgeInsets.only(top: 30.0),
            alignment: Alignment.topRight,
            child: Text(
              "$min - $max",
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: RangeSlider(
              values: selectedRange,
              onChanged: (RangeValues newValues) {
                setState(() {
                  selectedRange = newValues;
                  min=newValues.start.toInt();
                  max=newValues.end.toInt();
                });
              },
              max: 2000000,
              min: 800000,
              labels:
                  RangeLabels('${selectedRange.start}', '${selectedRange.end}'),
            ),
          )
        ],
      ),
    );
  }
}
