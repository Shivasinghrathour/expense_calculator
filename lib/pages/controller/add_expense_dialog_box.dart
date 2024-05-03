import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_calculator/model/tag_model.dart';
import 'package:expense_calculator/pages/controller/auth_controller.dart';

class AddExpenseController extends GetxController {
  final AuthController authController = Get.find();

  Tag? _selectedTag;
  Tag? get selectedTag => _selectedTag;

  void setSelectedTag(Tag? tag) {
    _selectedTag = tag;
    update();
  }

  final TextEditingController amountController = TextEditingController();

  void addExpenseDialogBox() {
    Get.defaultDialog(
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
          Obx(
            () => DropdownButton<Tag>(
              hint: const Padding(
                padding: EdgeInsets.all(15),
                child: Text("Select Tags"),
              ),
              value: selectedTag,
              items: predefinedTags.map((Tag tag) {
                return DropdownMenuItem<Tag>(
                  onTap: () {
                    setSelectedTag(tag);
                    print("${tag.tagName}");
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
                setSelectedTag(tag);
              },
            ),
          )
        ],
      ),
      contentPadding: const EdgeInsets.all(25),
      confirm: ElevatedButton(
        onPressed: () {
          authController.addExpenses();
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
