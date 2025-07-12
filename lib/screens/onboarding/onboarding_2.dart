import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var pageIndex = 0.obs;

  final List<Map<String, String>> pages = [
    {
      'title': 'Best online courses in the world',
      'subtitle': 'Now you can learn anywhere, anytime—even without internet!',
    },
    {
      'title': 'Explore your new skill today',
      'subtitle': "Let's learn & grow with Eduline!",
    },
  ];

  void updatePage(int index) => pageIndex.value = index;
}

class OnboardingScreen extends StatelessWidget {
  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
        itemCount: controller.pages.length,
        onPageChanged: controller.updatePage,
        itemBuilder: (_, index) {
          final page = controller.pages[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  page['title']!,
                  style: TextStyle(fontSize: size.width * 0.06, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  page['subtitle']!,
                  style: TextStyle(fontSize: size.width * 0.045),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  child: Text('Get Started'),
                  onPressed: () => Get.to(() => OnboardingScreen()),
                )

              ],
            ),
          );
        },
      ),
    );
  }
}
