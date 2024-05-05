import 'package:expense_calculator/model/expense_model.dart';
import 'package:expense_calculator/model/tag_model.dart';
import 'package:expense_calculator/pages/controller/auth_controller.dart';
import 'package:expense_calculator/pages/controller/tag_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditExpenseController extends GetxController {
  final AuthController authController = Get.put(AuthController());
  final ExpensesModel expensesModel = Get.put(ExpensesModel());
  final TagController tagController = Get.put(TagController());

  void editexpensedialog({required ExpensesModel expensesModel}) {
    Get.defaultDialog(
        title: "Edit Expense",
        content: Column(
          children: [
            TextFormField(
              controller: authController.editexpense,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
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
                      // Call setSelectedTag to update selectedTag when a tag is selected
                      // setSelectedTag(tag);

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
                  tagController.selectedTag.value = tag!;
                  tagController.selectedTag.refresh();
                },
              ),
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              authController.editExpenses(
                  expenseID: expensesModel.expenseID.toString(),
                  expenseModel: expensesModel);
            },
            child: const Text("Edit"),
          ),
        ]);
  }
}
