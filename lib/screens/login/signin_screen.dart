import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class SignInScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(child: Image.asset("assets/images/book.JPG", height: 80)),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  "Please login first to start your Theory Test.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
              CustomTextField(
                hintText: "Email Address",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: "Password",
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (v) {}),
                  const Text("Remember Me"),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password?", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              CustomButton(
                label: "Sign In",
                onPressed: () {
                  // TODO: Sign-in logic
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New to Theory Test?"),
                  TextButton(
                    onPressed: () {
                      // TODO: Go to SignUp
                    },
                    child: const Text("Create Account"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
