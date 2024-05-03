import 'package:expense_calculator/model/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatefulWidget {
  final String money;
  final ExpensesModel expensesModel;
  final VoidCallback ontap;
  final VoidCallback onedit;
  const ExpenseCard({
    super.key,
    required this.money,
    required this.expensesModel,
    required this.ontap,
    required this.onedit,
  });

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
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
                    widget.money,
                    style: const TextStyle(
                        fontSize: 34,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      // delte button
                      IconButton(
                          onPressed: widget.ontap,
                          icon: const Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.black,
                            size: 38,
                          )),
                      // edit button
                      IconButton(
                          onPressed: widget.onedit,
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: Colors.black,
                            size: 38,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
