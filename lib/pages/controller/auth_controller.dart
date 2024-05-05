import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_calculator/model/expense_model.dart';
import 'package:expense_calculator/model/tag_model.dart';
import 'package:expense_calculator/pages/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController user = TextEditingController();
  Rx<ExpensesModel> expensesModel = ExpensesModel().obs;
  Rx<Tag?> selectedTag = Rx<Tag?>(null);
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  final TextEditingController editexpense = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  StreamSubscription? subscription;

  RxList<ExpensesModel> expensesList = <ExpensesModel>[].obs;

  StreamSubscription? _subscription;

  Future<void> currentuser() async {
    _auth.authStateChanges().listen((event) {
      if (event != null) {
        _subscription = _firestore
            .collection("user")
            .doc(_auth.currentUser!.uid)
            .collection("expenses")
            .snapshots()
            .listen((snapshot) {
          expensesList.clear();
          final expenses = snapshot.docs
              .map((doc) => ExpensesModel.fromJson(doc.data()))
              .toList();
          expensesList.assignAll(expenses);
        });
      } else {
        expensesList.clear();
        Get.to(() => const LoginPage());
      }
    });
  }
  // functon for sum expenses of user

  double calculateTotalExpenses() {
    double total = 0;
    for (var expense in expensesList) {
      final expenseAmount = double.tryParse(expense.expenses ?? '0') ?? 0;
      print('Expense amount: $expenseAmount');
      total += expenseAmount;
    }
    print('Total expenses: $total');
    // getExpenses();
    return total;
  }

  @override
  void onInit() {
    super.onInit();
    currentuser();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  Future<void> addExpenses() async {
    final expenseID = DateTime.now().millisecondsSinceEpoch.toString();
    final expense = ExpensesModel(
      expenses: amountController.text,
      userName: user.text,
      expenseID: expenseID,
    );

    print("Adding expense: ${expense.expenses}");
    await _firestore
        .collection("user")
        .doc(_auth.currentUser!.uid)
        .collection("expenses")
        .doc(expenseID)
        .set(expense.toJson());
    amountController.clear();
  }

  Future<void> deleteExpenses({required String expenseID}) async {
    await _firestore
        .collection("user")
        .doc(_auth.currentUser!.uid)
        .collection("expenses")
        .doc(expenseID)
        .delete();
    print("Expense deleted: $expenseID");
  }

  Future<void> editExpenses(
      {required String expenseID, required ExpensesModel expenseModel}) async {
    await _firestore
        .collection("user")
        .doc(_auth.currentUser!.uid)
        .collection("expenses")
        .doc(expenseID)
        .update({
      "expenses": editexpense.text,
    });
    print("Expense edited: $expenseID");
  }

// add tags to firestore
  Future<void> addTagToFirestore(Tag tag) async {
    final tagID = DateTime.now().millisecondsSinceEpoch.toString();
    final expense = ExpensesModel(
      tags: selectedTag.value!.tagName,
      tagID: tagID,
    );
    await _firestore
        .collection("user")
        .doc(_auth.currentUser!.uid)
        .collection("tags")
        .doc(tagID)
        .set(expense.toJson());
    amountController.clear();
  }
}
