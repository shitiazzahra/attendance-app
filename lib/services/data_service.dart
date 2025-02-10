import 'package:cloud_firestore/cloud_firestore.dart';

// data service ini untuk pengantar ke API, get data dari internet
class DataService {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection("attendance");

  Future<QuerySnapshot> getData() {
    // data masuk ke firebase dan untuk mendapatkan data di get
    return dataCollection.get();
  }

  Future<void> deleteData(String docId) {
    return dataCollection.doc(docId).delete();
  }
}