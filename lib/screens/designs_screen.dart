import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tariq_al_raqi/classes/constants.dart';
import 'package:tariq_al_raqi/classes/designs.dart';
import 'package:tariq_al_raqi/screens/house_screen.dart';
import 'filter_screen.dart';

class DesignsScreen extends StatefulWidget {
  final List<Design> _designs;

  DesignsScreen(this._designs);

  @override
  _DesignsScreenState createState() => _DesignsScreenState();
}

class _DesignsScreenState extends State<DesignsScreen> {

  List<Widget> designCards = [];

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
    return Scaffold(appBar: AppBar(),
      backgroundColor: Constants.backgroundColor,
      body: ListView(
        itemExtent: 180,
        children: designCards,
        scrollDirection: Axis.vertical,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FilterScreen();
          }));
        },
        child: Icon(FontAwesomeIcons.filter,color: Constants.roqi,),
      ),
    );
  }
}

class HouseItem extends StatelessWidget {

  HouseItem(this.design);
  final f = NumberFormat("#,###,###.0#");
  final Design design;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(9.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HouseScreen(house: design);
          }));
        },
        child: Row(children: <Widget>[
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: design.url,
                placeholder: (context, url) => LoadingIndicator(
                    indicatorType: Indicator.ballClipRotateMultiple, /// Required, The loading type of the widget
                    colors: const [Constants.roqi],       /// Optional, The color collections
                    strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                    backgroundColor: Colors.black,      /// Optional, Background of the widget
                    pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
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
                      fontSize: 28.0,
                      fontWeight: FontWeight.w400,
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
      ),
    );
  }


}

