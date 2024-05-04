import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_calculator/model/tag_model.dart';
import 'package:get/get.dart';

class TagController extends GetxController {
  // instance for uploading data to firestore.
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> myTags() async {
    final snapshot = await _firestore.collection("tags").get();
  }
}
