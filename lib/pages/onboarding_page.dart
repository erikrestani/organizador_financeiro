import 'package:flutter/material.dart';

class OnBoardingPage {
  final String image;
  final String title;
  final String subtitle;
  final bool showButton;
  final String buttonText;
  OnBoardingPage({
    required this.image,
    required this.title,
    required this.subtitle,
    this.buttonText = 'How does it work?',
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
      buttonText: "How does it work? ",
    ),
    OnBoardingPage(
      image: 'assets/onboarding.png',
      title: 'Permission to Collect\n Behavioral Data',
      subtitle:
          '📱 Help Us Detect Early Signs\nTo predict mood shifts, we analyze\npatterns in phone usage, movement, and sleep trends.\n\n 🔒 Your Data is Private & Secure\nWe never sell your data. You control what is shared and can opt out anytime.',
      buttonText: "Grant Permission",
    ),
    OnBoardingPage(
      image: 'assets/onboarding.png',
      title: 'Mood Check-Ins',
      subtitle:
          "📝 Help Us Personalize Predictions\nA quick daily mood check-in helps\n improve accuracy.\n\nSet up reminders:\n\n[ ⏰ Morning ] [ ⏰ Evening ] [ ⏰ Both ] ",
      buttonText: 'Next',
    ),
    OnBoardingPage(
      image: 'assets/onboarding.png',
      title: 'Crisis & Support Plan',
      subtitle:
          "⚠️ Plan Ahead for Tough Moments\nSet up an emergency support plan so\n you have help when you need it.\nAdd a trusted contact 📞\nChoose a calming activity🧘\nSet up an automatic alert for major\nmood shifts 🚨",
      buttonText: 'Set Up Plan',
    ),
    OnBoardingPage(
      image: 'assets/onboarding.png',
      title: 'Personalized Insights\n& Alerts',
      subtitle:
          "📊 Stay One Step Ahead\nWe’ll notify you when we detect changes\nthat might signal a mood shift.\n✅ Get early warning signs based on your\ndata\n✅ Track patterns & triggers over time\n✅ Receive personalized\nrecommendations",
      buttonText: "Got it! Let's Start",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 110), // Distância da imagem
              child: Image.asset(
                _pages[_currentPage].image,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // PageView
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
                    Text(
                      page.title,
                      textAlign:
                          TextAlign.center, // Centraliza todos os títulos
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
                        textAlign: index == 0
                            ? TextAlign.center
                            : TextAlign
                                .start, // Centraliza apenas o subtítulo da primeira página
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
            child: Text(
              _pages[_currentPage].buttonText,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 5),
          if (_currentPage == 1)
            GestureDetector(
              onTap: () {},
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Learn More',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
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
