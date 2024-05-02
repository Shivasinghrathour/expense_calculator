import 'package:expense_calculator/model/expense_model.dart';
import 'package:expense_calculator/pages/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditExpenseController extends GetxController {
  final AuthController authController = Get.put(AuthController());
  final ExpensesModel expensesModel = Get.put(ExpensesModel());

  void editexpensedialog({required ExpensesModel expensesModel}) {
    Get.defaultDialog(
        title: "Edit Expense",
        content: TextFormField(
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
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              authController.editExpenses(
                  finalUID: expensesModel.expenseID.toString(),
                  expenseModel: expensesModel);
            },
            child: Text("Edit"),
          ),
        ]);
  }
}
