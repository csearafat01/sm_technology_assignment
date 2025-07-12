import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/app_routes.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  int? selectedIndex;

  final List<Map<String, dynamic>> languages = [
    {'name': 'English (US)', 'flag': 'assets/images/US.JPG'},
    {'name': 'Indonesia', 'flag': 'assets/images/Indonesia.JPG'},
    {'name': 'Afghanistan', 'flag': 'assets/images/afghan.JPG'},
    {'name': 'Algeria', 'flag': 'assets/images/Algeria.JPG'},
    {'name': 'Malaysia', 'flag': 'assets/images/Malay.JPG'},
    {'name': 'Arabic', 'flag': 'assets/images/arab.JPG'},
  ];

  void _onContinue() {
    // Save selected language or pass data if needed
    Get.offAllNamed(AppRoutes.home); // Replace with actual next screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Get.back(),
              ),
              const SizedBox(height: 8),
              Text(
                "What is Your Mother Language",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Discover what is a podcast description and podcast summary...",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: languages.length,
                  separatorBuilder: (_, __) => Divider(height: 16),
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    final isSelected = selectedIndex == index;

                    return InkWell(
                      onTap: () => setState(() => selectedIndex = index),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              lang['flag'],
                              width: 32,
                              height: 32,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(lang['name'],
                                style: TextStyle(fontSize: 16)),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.blue : Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              isSelected ? "Selected" : "Select",
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: selectedIndex != null ? _onContinue : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 56),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("Continue", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
