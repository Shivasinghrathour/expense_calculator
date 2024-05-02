import 'package:expense_calculator/pages/controller/add_expense_dialog_box.dart';
import 'package:expense_calculator/pages/controller/edit_expenses_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_calculator/pages/controller/auth_controller.dart';
import 'package:expense_calculator/widgets/expense_card.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final AddExpenseController addExpenseController =
        Get.put(AddExpenseController());
    final EditExpenseController editExpenseController =
        Get.put(EditExpenseController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Your Expenses"),
        backgroundColor: Colors.deepPurple,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical, // Set scroll direction to vertical

        child: Column(
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
            Obx(() => ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: authController.expensesList.length,
                  itemBuilder: (context, index) {
                    final expenses = authController.expensesList[index];
                    return ExpenseCard(
                            onedit: () {
                              // edit funtion

                              editExpenseController.editexpensedialog(
                                  expensesModel: expenses);
                            },
                            ontap: () {
                              // delete funtion
                              var expenseId = expenses.expenseID;

                              authController.deleteExpenses(
                                  finalUID: expenseId.toString());
                            },
                            expensesModel: expenses,
                            money: expenses.expenses.toString())
                        .marginAll(10);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
