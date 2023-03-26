import 'package:cloud_firestore/cloud_firestore.dart';

class addData {
  adminDataAdd(title, description, designation, type,img,thumbnailLink,category,time) async {
    try {
      await FirebaseFirestore.instance
          .collection("practice")
          .doc("add")
          .collection("222")
          .doc()
          .set({
        'title': title,
        'description': description,
        'designation': designation,
        'type': type,
        'url': img,
        'thumbnail': thumbnailLink,
        'category': category,
        'time_stamp':time,
      });
    } catch (e) {
      print(e);
    }
  }
}
