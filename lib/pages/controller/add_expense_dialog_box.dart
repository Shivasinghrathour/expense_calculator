import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_calculator/pages/controller/tag_controller.dart';
import 'package:expense_calculator/pages/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_calculator/model/tag_model.dart';
import 'package:expense_calculator/pages/controller/auth_controller.dart';

class AddExpenseController extends GetxController {
  AuthController authController = Get.put(AuthController());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Define selectedTag as an Rx variable
  Rx<Tag?> selectedTag = Rx<Tag?>(null);

  // Function to set the selected tag
  void setSelectedTag(Tag? tag) {
    selectedTag.value = tag;
  }
  // tag add to firestore

  final TextEditingController amountController = TextEditingController();
  final TagController tagController = Get.put(TagController());
  void addExpenseDialogBox() async {
    await Get.defaultDialog(
      title: "Add Expense",
      titleStyle: const TextStyle(fontSize: 25),
      content: Column(
        children: [
          TextFormField(
            controller: authController.amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          // Obx to listen for changes in selectedTag
          Obx(
            () => DropdownButton<Tag>(
              hint: const Padding(
                padding: EdgeInsets.all(15),
                child: Text("Select Tags"),
              ),
              value: tagController.selectedTag.value,
              items: predefinedTags.map((Tag tag) {
                return DropdownMenuItem<Tag>(
                  onTap: () {
                    tagController.selectedTag.value = tag;
                    tagController.selectedTag.refresh();
                  },
                  value: tag,
                  child: Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(color: tag.tagColor),
                      ),
                      const SizedBox(width: 10),
                      Text(tag.tagName),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (Tag? tag) {
                tagController.selectedTag.value = tag!;
                tagController.selectedTag.refresh();
              },
            ),
          )
        ],
      ),
      contentPadding: const EdgeInsets.all(25),
      confirm: ElevatedButton(
        onPressed: () {
          // Pass selectedTag to addExpenses function
          authController.addExpenses();
          tagController.addTag();
          tagController.getTagData();

          Get.back();
        },
        child: const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            "Confirm",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            "Cancel",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
