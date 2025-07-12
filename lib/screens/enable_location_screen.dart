import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/app_routes.dart';

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({super.key});

  void _handleEnable() {
    // TODO: Handle location permission logic (e.g. using geolocator)
    Get.offAllNamed(AppRoutes.selectLanguage); // Replace with your destination route
  }

  void _handleSkip() {
    Get.offAllNamed(AppRoutes.selectLanguage); // Or skip to home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              Image.asset(
                'assets/images/location.JPG', // Your location icon image
                height: 160,
              ),
              SizedBox(height: 32),
              Text(
                "Enable Location",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                "Kindly allow us to access your location to provide you with suggestions for nearby salons",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              Spacer(flex: 3),
              ElevatedButton(
                onPressed: _handleEnable,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 56),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Enable", style: TextStyle(fontSize: 16)),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: _handleSkip,
                child: Text(
                  "Skip, Not Now",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

