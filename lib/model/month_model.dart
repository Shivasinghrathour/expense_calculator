import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Month {
  final String monthName;
  final Color monthColor;
  Month({required this.monthColor, required this.monthName});
}

RxList<Month> monthList = [
  Month(monthColor: Colors.red, monthName: "January"),
  Month(monthColor: Colors.blue, monthName: "February"),
  Month(monthColor: Colors.yellow, monthName: "March"),
  Month(monthColor: Colors.pink, monthName: "April"),
  Month(monthColor: Colors.green, monthName: "May"),
  Month(monthColor: Colors.purple, monthName: "June"),
  Month(monthColor: Colors.orange, monthName: "July"),
  Month(monthColor: Colors.lime, monthName: "August"),
  Month(monthColor: Colors.teal, monthName: "September"),
  Month(monthColor: Colors.cyan, monthName: "October"),
  Month(monthColor: Colors.indigo, monthName: "November"),
  Month(monthColor: Colors.grey, monthName: "December"),
].obs;
