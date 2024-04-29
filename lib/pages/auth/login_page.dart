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
        title: Text("Login"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 40),
            Center(
              child: Text(
                "Login to continue",
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
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
                  authController.Login();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
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
