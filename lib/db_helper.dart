import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tariq_al_raqi/classes/constants.dart';
import 'package:tariq_al_raqi/classes/designs.dart';

class DBHelper {
   static List<Design> designs = [];

  Future<void> getDesigns() async {
    final _firestore = FirebaseFirestore.instance;
    var x = await _firestore.collection("designs").get().then((querySnapshot) {
       querySnapshot.docs.forEach((result) async {
        Design design = Design();
        design.type = result.get(Constants.TYPE);
        design.majls = result.get(Constants.MAJLS);
        design.maid = result.get(Constants.MAID);
        design.bathroom = result.get(Constants.BATH);
        design.bedroom = result.get(Constants.BED);
        design.price = result.get(Constants.PRICE);
        design.kitchen = result.get(Constants.KITCHEN);
        design.living = result.get(Constants.LIVING);
        design.store = result.get(Constants.STORE);
        design.dining = result.get(Constants.DINING);
        design.url= await _getImages(design.type);
        designs.add(design);
      });
    });
  }

  Future<dynamic> _getImages(type) async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('Designs/$type.jpg');
    dynamic url = await ref.getDownloadURL();
    return url;
  }


  void signConfirmed() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('signed', true);
  }
   Future<bool> checkSigned() async{
     final prefs = await SharedPreferences.getInstance();
     final sign = prefs.getBool('signed') ?? false;
     return sign;
   }
}