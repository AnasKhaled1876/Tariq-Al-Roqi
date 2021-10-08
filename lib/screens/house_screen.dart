import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sizer/sizer.dart';
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
          margin: EdgeInsets.only(left: 5.w),
          child: Text(
            "Type ${house.type}",
            style: TextStyle(
                fontSize: 19.sp,
                fontFamily: "Lato",
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  width: 80.w,
                  height: 35.h,
                  imageUrl: house.url,
                  placeholder: (context, url) => LoadingIndicator(
                      indicatorType: Indicator.ballClipRotateMultiple,
                      colors: const [Constants.roqiColor],
                      strokeWidth: 2,
                      backgroundColor: Colors.black,
                      pathBackgroundColor: Colors.black),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(
                "\nThe Finest Designs\n With the Best Equipment\n and The Highest Quality \n from the Design to The Key\nYour Highway to Paradise",
                style: TextStyle(
                    fontFamily: 'Lato',
                    wordSpacing: 1.3,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Container(margin: EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w),
                alignment: Alignment.centerLeft,
                child: Text("Description",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                        color: Colors.black),
                    textAlign: TextAlign.start),
              ),
              Container(
                width: double.infinity,
                height: 20.h,
                child: ListView(
                  itemExtent: 36.w,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 30.w,
                      height: 15.h,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.bed,
                          color: Constants.roqiColor,
                          size: 20.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 2.5.h),
                          child: Text(
                            "${house.bedroom} \nBedroom",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 30.w,
                      height: 15.h,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.bath,
                          color: Constants.roqiColor,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 2.5.h),
                          child: Text(
                            "${house.bathroom} \nBathroom",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 30.w,
                      height: 15.h,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.couch,
                          color: Constants.roqiColor,
                          size: 20.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 2.5.h),
                          child: Text(
                            "${house.living} \nLiving Room",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 30.w,
                      height: 15.h,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.userFriends,
                          color: Constants.roqiColor,
                          size: 20.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 2.5.h),
                          child: Text(
                            "${house.majls} \nMajls",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 30.w,
                      height: 15.h,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.pizzaSlice,
                          color: Constants.roqiColor,
                          size: 20.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 2.5.h),
                          child: Text(
                            "${house.kitchen} \nKitchen",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 30.w,
                      height: 15.h,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.female,
                          color: Constants.roqiColor,
                          size: 20.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 2.5.h),
                          child: Text(
                            "${house.maid} \nMaid Room",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 30.w,
                      height: 15.h,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.doorClosed,
                          color: Constants.roqiColor,
                          size: 20.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 2.5.h),
                          child: Text(
                            "${house.store} \nStorage ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 30.w,
                      height: 15.h,
                      child: ListTile(
                        title: Icon(
                          FontAwesomeIcons.chair,
                          color: Constants.roqiColor,
                          size: 20.0,
                        ),
                        subtitle: Container(
                          margin: EdgeInsets.only(top: 2.5.h),
                          child: Text(
                            "${house.dining} \nDining Room",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
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
                      width: 3.w,
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