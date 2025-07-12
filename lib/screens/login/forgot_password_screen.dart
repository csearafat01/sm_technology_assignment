import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/app_routes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Get.back(),
              ),
              const SizedBox(height: 12),
              Text(
                "Forgot Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Enter your email, we will send a verification code to email",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              CustomTextField(
                hintText: "Email Address",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 32),
              CustomButton(
                label: "Continue",
                onPressed: () {
                  // Normally send OTP or link
                  Get.toNamed(AppRoutes.resetPassword);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
