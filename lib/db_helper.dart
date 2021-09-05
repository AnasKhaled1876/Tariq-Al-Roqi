import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:tariq_al_raqi/constants.dart';
import 'package:tariq_al_raqi/designs.dart';

class DBHelper{

  List<Design> designs=[];

  int _items = 0;
  void getDesigns() async {
    await Firebase.initializeApp();
    final _firestore = FirebaseFirestore.instance;
    _firestore.collection("designs").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
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
        designs.add(design);
      });
    });

  }

    Future<void> downloadURLExample() async {
      for(int i=0;i<_items;i++) {
        String downloadURL = await firebase_storage.FirebaseStorage.instance
            .ref('users/${designs[i].type}.jpg')
            .getDownloadURL();
      }
  }

}





// print(result.get(Constants.TYPE));
// print(result.get(Constants.MAJLS));
// print(result.get(Constants.PRICE));
// print(result.get(Constants.BED));
// print(result.get(Constants.BATH));
// print(result.get(Constants.MAID));
// print(result.get(Constants.DINING));
// print(result.get(Constants.KITCHEN));
// print(result.get(Constants.LIVING));
// print(result.get(Constants.STORE));