import 'package:expense_calculator/firebase_options.dart';
import 'package:expense_calculator/pages/auth/signup_page.dart';
import 'package:expense_calculator/pages/view/expense_page.dart';
import 'package:expense_calculator/pages/view/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Expense Tracker",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const ExpensePage(),
    );
  }
}
