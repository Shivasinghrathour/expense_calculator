import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_calculator/model/expense_model.dart';
import 'package:expense_calculator/pages/auth/login_page.dart';
import 'package:expense_calculator/pages/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getExpenses();
  }

  Rx<ExpensesModel> expensesModel = ExpensesModel().obs;
  StreamSubscription? subscription;
  final List expensesList = <ExpensesModel>[].obs;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController user = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> signup() async {
    await auth.createUserWithEmailAndPassword(
        email: email.text, password: pass.text);
    email.clear();
    pass.clear();
    Get.to(() => const LoginPage());
  }

  Future<void> Login() async {
    await auth.signInWithEmailAndPassword(
        email: email.text, password: pass.text);

    Get.to(() => const HomePage());
    email.clear();
    pass.clear();
  }
  // store user data

  Future<void> addExpenses() async {
    var finalUID = DateTime.now().millisecond;
    var expensesModel = ExpensesModel(
      expenses: amountController.text,
      userName: user.text,
    );
    await firestore
        .collection("user")
        .doc(auth.currentUser!.uid)
        .collection("expenses")
        .doc(finalUID.toString())
        .set(expensesModel.toJson());
    getExpenses();
  }

  Stream<List<ExpensesModel>> getExpenses() {
    final subscription = firestore
        .collection("user")
        .doc(auth.currentUser!.uid)
        .collection("expenses")
        .snapshots()
        .listen((data) {
      final docData = data.docs;

      if (docData.isNotEmpty) {
        docData.forEach((element) {
          print(element.data());
          ExpensesModel.fromJson(element.data());
        });
      } else {
        print("Data not Found");
      }
    });
  }
}
