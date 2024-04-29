import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_calculator/model/expense_model.dart';
import 'package:expense_calculator/pages/auth/login_page.dart';
import 'package:expense_calculator/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<ExpensesModel> expensesModel = ExpensesModel().obs;
  
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

  Future<void> getExpenses() async {
    expensesModel.value = ExpensesModel(
      expenses: amountController.text,
      userName: user.text,
    );
    firestore
        .collection("user")
        .doc(auth.currentUser!.uid)
        .collection("expenses")
        .doc(auth.currentUser!.uid)
        .set(expensesModel.value.toJson());
  }
}
