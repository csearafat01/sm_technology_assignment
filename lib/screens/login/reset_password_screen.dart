import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/app_routes.dart';
import '../../widgets/custom_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscure1 = true;
  bool obscure2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              const SizedBox(height: 16),
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Get.back(),
              ),
              const SizedBox(height: 12),
              Text(
                "Reset Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Your password must be at least 8 characters long and include a combination of letters, numbers",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // New Password
              TextField(
                controller: newPasswordController,
                obscureText: obscure1,
                decoration: InputDecoration(
                  hintText: "New Password",
                  suffixIcon: IconButton(
                    icon: Icon(obscure1 ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => obscure1 = !obscure1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
              const SizedBox(height: 16),

              // Confirm Password
              TextField(
                controller: confirmPasswordController,
                obscureText: obscure2,
                decoration: InputDecoration(
                  hintText: "Confirm New Password",
                  suffixIcon: IconButton(
                    icon: Icon(obscure2 ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => obscure2 = !obscure2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(
                label: "Submit",
                onPressed: () {
                  // Password reset logic
                  if (newPasswordController.text == confirmPasswordController.text &&
                      newPasswordController.text.length >= 8) {
                    Get.toNamed(AppRoutes.varifyCode);
                  } else {
                    Get.snackbar("Error", "Passwords do not match or are too short.");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
