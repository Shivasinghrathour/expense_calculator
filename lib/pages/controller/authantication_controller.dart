import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_calculator/pages/auth/login_page.dart';
import 'package:expense_calculator/pages/auth/signup_page.dart';
import 'package:expense_calculator/pages/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authentication extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController user = TextEditingController();
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> signup() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email.text, password: pass.text);
      email.clear();
      pass.clear();
      Get.to(() => const LoginPage());
    } catch (ex) {
      print(ex.toString());
    }
  }

  Future<void> login() async {
    await auth.signInWithEmailAndPassword(
        email: email.text, password: pass.text);

    Get.to(() => const HomePage());
    email.clear();
    pass.clear();
  }

  Future<void> logout() async {
    await auth.signOut();
    Get.to(() => const SignupPage());
  }
}
