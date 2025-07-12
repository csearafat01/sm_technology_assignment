import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/app_routes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/success_dialog.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscure = true;
  String passwordStrength = '';
  Color strengthColor = Colors.grey;

  void checkPasswordStrength(String password) {
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    setState(() {
      if (password.isEmpty) {
        passwordStrength = '';
        strengthColor = Colors.grey;
      } else if (regex.hasMatch(password)) {
        passwordStrength = 'Strong';
        strengthColor = Colors.green;
      } else {
        passwordStrength = 'Weak';
        strengthColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              const SizedBox(height: 12),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                "Welcome to Eduline",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Let’s join to Eduline learning ecosystem & meet our professional mentor. It’s Free!",
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 24),

              // Email
              CustomTextField(
                hintText: "Email Address",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Full Name
              CustomTextField(
                hintText: "Full Name",
                controller: nameController,
              ),
              const SizedBox(height: 16),

              // Password with visibility toggle
              TextField(
                controller: passwordController,
                obscureText: obscure,
                onChanged: checkPasswordStrength,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => obscure = !obscure),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),

              // Strength Text
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Row(
                  children: [
                    if (passwordStrength.isNotEmpty)
                      Icon(
                        passwordStrength == 'Strong'
                            ? Icons.check_circle
                            : Icons.warning_amber,
                        size: 16,
                        color: strengthColor,
                      ),
                    const SizedBox(width: 4),
                    if (passwordStrength.isNotEmpty)
                      Text(
                        passwordStrength == 'Strong'
                            ? "At least 8 characters with letters and numbers"
                            : "Use a mix of letters and numbers",
                        style: TextStyle(fontSize: 12, color: strengthColor),
                      ),
                    const Spacer(),
                    if (passwordStrength.isNotEmpty)
                      Text(
                        passwordStrength,
                        style: TextStyle(color: strengthColor),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Button

        CustomButton(
        label: "Label",
          onPressed: () {
            // Mock validation success
            if (emailController.text.isNotEmpty &&
                nameController.text.isNotEmpty &&
                passwordController.text.length >= 8) {
              Get.dialog(
                SuccessDialog(
                  onContinue: () {
                    Get.back(); // Close dialog
                    Get.offAllNamed(AppRoutes.signin); // Navigate to SignIn or Home
                  },
                ),
              );
            } else {
              Get.snackbar("Error", "Please fill all fields correctly.");
            }
          },
        ),

        const SizedBox(height: 24),

              // Already have account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () => Get.back(), // Go back to sign in
                    child: Text("Sign In", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
