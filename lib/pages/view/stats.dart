import 'package:expense_calculator/model/month_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    Rx<Month?> seletedMonth = Rx<Month?>(null);
    void getmonth(Month? month) {
      seletedMonth.value = month;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stats"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Obx(() => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<Month>(
                        focusColor: Colors.cyan,
                        focusNode: FocusNode(skipTraversal: true),
                        isExpanded: true,
                        icon: const Icon(
                          Icons.arrow_circle_down_rounded,
                          size: 30,
                        ),
                        hint: const Text("Select Month",
                            style: TextStyle(color: Colors.black)),
                        value: seletedMonth.value,
                        items: monthList
                            .map((e) => DropdownMenuItem<Month>(
                                value: e,
                                onTap: () {
                                  getmonth(e);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      color: e.monthColor,
                                    ),
                                    SizedBox(width: 10),
                                    Text(e.monthName),
                                  ],
                                )))
                            .toList(),
                        onChanged: (Month? month) {
                          getmonth(month);
                        }),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
