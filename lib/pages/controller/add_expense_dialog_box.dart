import 'package:expense_calculator/pages/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpenseController extends GetxController {
  RxList expanses = [].obs;
  final TextEditingController amountController = TextEditingController();
  AuthController authController = Get.put(AuthController());
  void addExpenseDialogBox() {
    Get.defaultDialog(
      title: "Add Expense",
      titleStyle: TextStyle(
        fontSize: 25,
      ),
      content: TextFormField(
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
      contentPadding: const EdgeInsets.all(25),
      // add expense button
      confirm: ElevatedButton(
          onPressed: () {
            authController.addExpenses();
          },
          child: const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              "Confirm",
              style: TextStyle(fontSize: 18),
            ),
          )),
      // cancel button
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
          )),
    );
  }
  // function for adding expense
}
