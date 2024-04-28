import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpensePage extends StatelessWidget {
  const ExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    var globalController;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Your Expenses"),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 50,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            "Total Expenses",
            style: TextStyle(fontSize: 38),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // expenses result area
              Container(
                height: 180,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: BorderRadius.circular(40)),
                child: const Center(
                  child: Text(
                    "500",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.white,
            height: 50,
            indent: 25,
            endIndent: 25,
            thickness: 4,
          )
        ],
      ),
    );
  }
}
