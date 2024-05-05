import 'package:expense_calculator/pages/auth/login_page.dart';
import 'package:expense_calculator/pages/controller/auth_controller.dart';
import 'package:expense_calculator/pages/controller/authantication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    Authentication authentication = Get.put(Authentication());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up "),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Text(
                "Create an account",
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ),
            TextFormField(
              controller: authentication.user,
              decoration: const InputDecoration(
                hintText: "User Name",
              ),
            ),
            TextFormField(
              controller: authentication.email,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: authentication.pass,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                await authentication.signup();
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.to(const LoginPage());
                },
                child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
