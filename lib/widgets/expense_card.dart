import 'package:expense_calculator/model/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final String money;
  final ExpensesModel expensesModel;
  const ExpenseCard(
      {super.key, required this.money, required this.expensesModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 70,
            padding: const EdgeInsets.only(left: 40),
            decoration: BoxDecoration(
              color: Colors.deepPurple[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    money,
                    style: const TextStyle(
                        fontSize: 34,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.black,
                        size: 38,
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
