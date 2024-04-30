import 'package:expense_calculator/pages/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Text(
                "Login to continue",
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
            ),
            TextFormField(
              controller: authController.email,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: authController.pass,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  authController.login();
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontSize: 22),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
