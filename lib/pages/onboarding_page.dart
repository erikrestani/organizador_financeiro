import 'package:flutter/material.dart';

class OnBoardingPage {
  final String image;
  final String title;
  final String subtitle;
  final bool showButton;

  OnBoardingPage({
    required this.image,
    required this.title,
    required this.subtitle,
    this.showButton = true,
  });
}

class OnBoardingOne extends StatefulWidget {
  const OnBoardingOne({super.key});

  @override
  _OnBoardingOneState createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnBoardingPage> _pages = [
    OnBoardingPage(
      image: 'assets/onboarding.png',
      title: 'Your Personal\nGuide to Stability',
      subtitle:
          'We help you track patterns,\n detect early warning signs, and\n take action before mood\n episodes happen.',
    ),
    OnBoardingPage(
      image: 'assets/onboarding.png',
      title: 'Permission to Collect\n Behavioral Data',
      subtitle:
          '📱 Help Us Detect Early Signs\nTo predict mood shifts, we analyze\n patterns in phone usage, movement, and sleep trends.\n\n 🔒 Your Data is Private & Secure\nWe never sell your data. You control what is shared and can opt out anytime.',
    ),
    OnBoardingPage(
      image: 'assets/onboarding.png',
      title: 'Get Insights',
      subtitle: 'Receive personalized insights based on your data.',
    ),
    OnBoardingPage(
      image: 'assets/onboarding.png',
      title: 'Take Action',
      subtitle: 'Act on early warning signs with guided steps.',
    ),
    OnBoardingPage(
      image: 'assets/onboarding.png',
      title: 'Stay Connected',
      subtitle: 'Share your progress with your support network.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final page = _pages[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(page.image, height: 150, fit: BoxFit.cover),
                    const SizedBox(height: 20),
                    Text(
                      page.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Color(0xFF090A0A),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        page.subtitle,
                        textAlign:
                            index == 1 ? TextAlign.left : TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF090A0A),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? const Color(0xFF9116FE)
                      : Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9116FE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 15,
              ),
            ),
            child: const Text(
              'How does it work?',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {},
            child: RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: 'Have an account? '),
                  TextSpan(
                    text: 'Log in',
                    style: TextStyle(
                      color: Color(0xFF9116FE),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
