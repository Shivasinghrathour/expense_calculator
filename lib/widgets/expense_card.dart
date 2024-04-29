import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                  const Text(
                    "50",
                    style: TextStyle(
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
