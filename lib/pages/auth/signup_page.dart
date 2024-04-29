import 'package:expense_calculator/pages/auth/login_page.dart';
import 'package:expense_calculator/pages/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up "),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: Text(
                "Create an account",
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ),
            TextFormField(
              controller: authController.user,
              decoration: InputDecoration(
                hintText: "User Name",
              ),
            ),
            TextFormField(
              controller: authController.email,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: authController.pass,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                authController.signup();
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.to(LoginPage());
                },
                child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
