import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/onboarding/onboarding_contoller.dart';
import '../../widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  final controller = Get.put(OnboardingController());

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboarding1.JPG",
      "title": "Best online courses in the world",
      "description": "Now you can learn anywhere, anytime, even if there is no internet access!",
      "button": "Next"
    },
    {
      "image": "assets/images/onboarding2.JPG",
      "title": "Explore your new skill today",
      "description": "Our platform is designed to help you explore new skills. Let's learn & grow with Eduline!",
      "button": "Get Started"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final index = controller.currentIndex.value;
        final data = onboardingData[index];

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 60),
            Image.asset(data['image']!, height: MediaQuery.of(context).size.height * 0.4),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    data['title']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    data['description']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (i) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: i == index ? Colors.blue : Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            CustomButton(
              label: data['button']!,
              onPressed: controller.nextPage,
            ),
            const SizedBox(height: 40),
          ],
        );
      }),
    );
  }
}
