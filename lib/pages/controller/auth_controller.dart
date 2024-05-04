import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_calculator/model/expense_model.dart';
import 'package:expense_calculator/model/tag_model.dart';
import 'package:expense_calculator/pages/auth/login_page.dart';
import 'package:expense_calculator/pages/controller/add_expense_dialog_box.dart';
import 'package:expense_calculator/pages/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AuthController extends GetxController {
  Tag? tag;
  var uuid = const Uuid();
  final ExpensesModel exp = Get.put(ExpensesModel());
  Rx<ExpensesModel> expensesModel = ExpensesModel().obs;
  final AddExpenseController addExpenseController =
      Get.put(AddExpenseController());
  // RxList<ExpensesModel> expensesList = <ExpensesModel>[].obs;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController editexpense = TextEditingController();
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

  Future<void> login() async {
    await auth.signInWithEmailAndPassword(
        email: email.text, password: pass.text);

    Get.to(() => const HomePage());
    email.clear();
    pass.clear();
  }

  StreamSubscription? subscription;

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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<ExpensesModel> expensesList = <ExpensesModel>[].obs;

  StreamSubscription? _subscription;

  Future<void> currentuser() async {
    auth.authStateChanges().listen((event) {
      if (event != null) {
        _subscription = _firestore
            .collection("user")
            .doc(_auth.currentUser!.uid)
            .collection("expenses")
            .snapshots()
            .listen((snapshot) {
          final expenses = snapshot.docs
              .map((doc) => ExpensesModel.fromJson(doc.data()))
              .toList();
          expensesList.assignAll(expenses);
        });
      } else {
        Get.to(() => const LoginPage());
      }
    });
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
    final finalUID = DateTime.now().millisecondsSinceEpoch.toString();
    final expense = ExpensesModel(
      expenses: amountController.text,
      userName: user.text,
      expenseID: DateTime.now().millisecondsSinceEpoch.toString(),
      // tags: addExpenseController.selectedTag.value,
    );

    print("Adding expense: ${expense.expenses}");
    await _firestore
        .collection("user")
        .doc(_auth.currentUser!.uid)
        .collection("expenses")
        .doc(finalUID)
        .set(expense.toJson());
    amountController.clear();
    //  print("${addExpenseController.selectedTag.value}");
  }
// delete expenses

  Future<void> deleteExpenses({required String finalUID}) async {
    await _firestore
        .collection("user")
        .doc(auth.currentUser!.uid)
        .collection("expenses")
        .doc(finalUID)
        .delete();
    print("after calling funtion $finalUID");
  }

  // edit expenses
  Future<void> editExpenses(
      {required String finalUID, required ExpensesModel expenseModel}) async {
    await _firestore
        .collection("user")
        .doc(auth.currentUser!.uid)
        .collection("expenses")
        .doc(finalUID)
        .update({
      "expenses": editexpense.text,
    });
    print("after calling funtion $finalUID");
  }
}
