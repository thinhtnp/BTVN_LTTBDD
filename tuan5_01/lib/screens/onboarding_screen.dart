import 'package:flutter/material.dart';
import '../models/onboarding_page.dart';
import '../widgets/onboarding_page_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  final List<OnboardingPage> pages = [
    OnboardingPage(
      image: "assets/onboarding_1.png",
      title: "Easy Time Management",
      description:
      "With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first.",
    ),
    OnboardingPage(
      image: "assets/onboarding_2.png",
      title: "Increase Work Effectiveness",
      description:
      "Time management and the determination of more important tasks will give your job statistics better and always improve.",
    ),
    OnboardingPage(
      image: "assets/onboarding_3.png",
      title: "Reminder Notification",
      description:
      "The advantage of this application is that it also provides reminders for you so you don't forget to keep doing your assignments well and according to the time you have set.",
    ),
  ];

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // SKIP
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: const Text("skip"),
              ),
            ),

            // PAGEVIEW
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, index) {
                  return OnboardingPageView(page: pages[index]);
                },
              ),
            ),

            // INDICATOR
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                    (index) => Container(
                  margin: const EdgeInsets.all(4),
                  width: currentIndex == index ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.blue
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // NÚT ĐIỀU HƯỚNG
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  if (currentIndex > 0)
                    IconButton(
                      onPressed: previousPage,
                      icon: const Icon(Icons.arrow_back),
                    ),
                  const Spacer(),
                  SizedBox(
                    width: 160,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: nextPage,
                      child: Text(
                        currentIndex == pages.length - 1
                            ? "Get Started"
                            : "Next",
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
