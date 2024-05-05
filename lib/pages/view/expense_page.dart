import 'package:expense_calculator/model/add_tag_model.dart';
import 'package:expense_calculator/pages/controller/add_expense_dialog_box.dart';
import 'package:expense_calculator/pages/controller/auth_controller.dart';
import 'package:expense_calculator/pages/controller/edit_expenses_dialog_box.dart';
import 'package:expense_calculator/pages/controller/tag_controller.dart';
import 'package:expense_calculator/pages/view/stats.dart';
import 'package:expense_calculator/widgets/expense_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    AddExpenseController addExpenseController = Get.put(AddExpenseController());
    EditExpenseController editExpenseController =
        Get.put(EditExpenseController());

    TagController tagController = Get.put(TagController());

    AddTagModel? addTagModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Your Expenses"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const Stats());
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          // Call dialog box to add expense
          // Assuming you have a method in your AuthController to show the add expense dialog
          addExpenseController.addExpenseDialogBox();

          authController.amountController.clear();
        },
        child: const Icon(
          Icons.add,
          size: 50,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          const Text(
            "Total Expenses",
            style: TextStyle(fontSize: 38),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.deepPurple[200],
                borderRadius: BorderRadius.circular(14)),
            child: Obx(() => Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "${authController.calculateTotalExpenses()}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ),
          const Divider(
            color: Colors.white,
            height: 50,
            indent: 25,
            endIndent: 25,
            thickness: 4,
          ),
          // Display expenses using ListView.builder
          Obx(
            () => Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: authController.expensesList.length,
                itemBuilder: (context, index) {
                  final expenses = authController.expensesList[index];
                  final tag = tagController.taglist[index];

                  return ExpenseCard(
                          tag: tag.tagname!,
                          
                          onedit: () {
                            // edit funtion

                            editExpenseController.editexpensedialog(
                                expensesModel: expenses);
                          },
                          ontap: () {
                            // delete funtion

                            authController.deleteExpenses(
                                expenseID: expenses.expenseID!,
                                expensesModel: expenses);

                            // delete tag function

                            // var tagid = expenses.tagID;
                            // authController.deleteTag(tagID: tagid!);
                          },
                          expensesModel: expenses,
                          money: expenses.expenses.toString())
                      .marginAll(10);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
