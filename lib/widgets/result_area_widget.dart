import 'package:expense_calculator/pages/controller/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultAreaWidget extends StatelessWidget {
  const ResultAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalController globalController = Get.put(GlobalController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 180,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.deepPurple[200],
              borderRadius: BorderRadius.circular(40)),
          child: Center(
            child: Obx(
              () => Text(
                globalController.x.value.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
