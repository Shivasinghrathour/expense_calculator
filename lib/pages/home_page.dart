import 'package:expense_calculator/pages/controller/global_controller.dart';
import 'package:expense_calculator/pages/expense_page.dart';
import 'package:expense_calculator/widgets/result_area_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalController globalController = Get.put(GlobalController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.to(ExpensePage());
              },
              child: Text("Add Expenses"))
        ],
        centerTitle: true,
        title: const Text("Expense Traker Application"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          // result display area
          const SizedBox(height: 180),
          const ResultAreaWidget(),
          // button for addition and subtraction
          const SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  globalController.addition();
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    "Additon",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  globalController.subtraction();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    "Subtraction",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
