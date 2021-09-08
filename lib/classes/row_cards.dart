import 'package:flutter/material.dart';

class RoomLabel extends StatelessWidget {

  final String label;

  RoomLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "   $label",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.black),
      ),
    );
  }
}

class BoxContain extends StatelessWidget {

  final String num;
  final Color color;

  BoxContain(this.num,this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: NumberCard(num,color),
    );
  }
}

class NumberCard extends StatelessWidget {

  final String number;
  final Color color;

  NumberCard(this.number,this.color);

  @override
  Widget build(BuildContext context) {
    return Card(color: color,
      elevation: 5.0,
      child: Center(
        child: Text(
          number,
          style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}