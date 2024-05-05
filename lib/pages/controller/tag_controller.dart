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

    Future.delayed(1.seconds);

    selectedTag.value = null;
  }

  StreamSubscription? subscription;
  Future<void> getTagData() async {
    subscription = _firestore
        .collection("user")
        .doc(_auth.currentUser!.uid)
        .collection("tags")
        .snapshots()
        .listen((event) {
      final tag =
          event.docs.map((e) => AddTagModel.fromJson(e.data())).toList();

      if (tag.isNotEmpty) {
        // Clear the tag list data before adding new data
        taglist.clear();

        // Add new data
        taglist.assignAll(tag);

        //
        taglist.refresh();
      } else {
        // do nothing
        return;
      }
    });
  }

  Future<void> deleteTag({required String tagID}) async {
    await _firestore
        .collection("user")
        .doc(_auth.currentUser!.uid)
        .collection("tags")
        .doc(tagID)
        .delete();
  }

  Future<void> editTag({required String tagID, required String tagName}) async {
    await _firestore
        .collection("user")
        .doc(_auth.currentUser!.uid)
        .collection("tags")
        .doc(tagID)
        .update({"tagname": tagName});
  }

  @override
  void onClose() {
    subscription!.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    getTagData();
    super.onInit();
  }
}
