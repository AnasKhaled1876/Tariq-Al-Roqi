import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
            fontWeight: FontWeight.w600, fontSize: 17.sp, color: Colors.black),
      ),
    );
  }
}

class BoxContain extends StatelessWidget {
  final String num;
  final Color color;

  BoxContain(this.num, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13.w,
      height: 6.h,
      child: NumberCard(num, color),
    );
  }
}

class NumberCard extends StatelessWidget {
  final String number;
  final Color color;

  NumberCard(this.number, this.color);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 5.0,
      child: Center(
        child: Text(
          number,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
