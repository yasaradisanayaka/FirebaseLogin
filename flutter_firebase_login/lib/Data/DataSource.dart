import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future <void> addStudent(Map<String, dynamic> studentInfo, String id) async {
    try {
      await FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .set(studentInfo);
    } catch (e) {
      print("Error: $e");
    }
  }
}