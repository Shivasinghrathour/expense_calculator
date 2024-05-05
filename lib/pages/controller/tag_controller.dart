import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_calculator/model/add_tag_model.dart';
import 'package:expense_calculator/model/tag_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class TagController extends GetxController {
  // instance for uploading data to firestore.
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Rx<Tag?> selectedTag = Rx<Tag?>(null);
  RxList<AddTagModel> taglist = <AddTagModel>[].obs;

  Future<void> addTag() async {
    final tagid = DateTime.now().millisecondsSinceEpoch.toString();
    final tag = AddTagModel(
      tagname: selectedTag.value!.tagName,
      tagId: tagid,
    );
    await _firestore
        .collection("user")
        .doc(_auth.currentUser!.uid)
        .collection("tags")
        .doc(tagid)
        .set(tag.toJson());
    print("Tad added to firestore");
  }

  StreamSubscription? subscription;
  Future<void> getTagData() async {
    subscription = await _firestore
        .collection("user")
        .doc(_auth.currentUser!.uid)
        .collection("tags")
        .snapshots()
        .listen((event) {
      final tag =
          event.docs.map((e) => AddTagModel.fromJson(e.data())).toList();

      taglist.assignAll(tag);
    });
  }
}
