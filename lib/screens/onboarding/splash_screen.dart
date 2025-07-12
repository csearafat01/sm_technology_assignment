import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/app_routes.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.toNamed(AppRoutes.onboarding);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/car.JPG', height: 100),
            const SizedBox(height: 20),
            const Text(
              "Theory test in my language",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                "I must write the real test in English language and this app just helps you to understand the materials in your language",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
