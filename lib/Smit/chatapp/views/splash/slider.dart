import 'package:dashboard/Smit/chatapp/views/Auth/singin.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "image": "asset/image/slide1.json",
      "text": "Stay connected with your loved ones!\nBringing you closer to family and friends!",
    },
    {
      "image": "asset/image/slide2.json",
      "text": "More Than Just a Chat App \n and Experience  the Power of AI! \nEngage in intelligent conversations with\n AI that can assist, guide, and even provide recommendations based on your needs.",
    },
    {
      "image": "asset/image/slide3.json",
      "text": "Your adventure begins here, start your\n journey with us today and stay connected!",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          // Image filling half of the screen
          Container(
            height: MediaQuery.of(context).size.height * 0.5, // 50% of screen height
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) => Lottie.asset(
                onboardingData[index]["image"]!,
                fit: BoxFit.fill, // Ensures the image covers the container properly
                width: double.infinity,
              ),
            ),
          ),

          SizedBox(height: 20),

          // Text directly below images
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              onboardingData[_currentPage]["text"]!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white,),
             // textAlign: TextAlign.center,
            ),
          ),

          Spacer(),

          // Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => buildDot(index: index),
            ),
          ),

          SizedBox(height: 20),

          // Button at the bottom
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {
                if (_currentPage == onboardingData.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                } else {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                _currentPage == onboardingData.length - 1 ? "Get Started" : "Next",
                style: TextStyle(fontSize: 18, color: Colors.teal, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: _currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.white : const Color.fromRGBO(158, 158, 158, 1),
        borderRadius: BorderRadius.circular(4),
     ),);
}
}
