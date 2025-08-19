import 'package:flutter/material.dart';
import 'package:homehaven/constant.dart';
import 'package:homehaven/screens/auth/login_screen.dart';
import 'package:homehaven/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int count = 1;

  Color getPointColor(int pointIndex) {
    return (count == pointIndex) ? kPrimaryColor : const Color(0xffE0E0E0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(imagePath + "onboarding_$count.png", fit: BoxFit.fill),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              onboardingTitle[count - 1],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              onboardingSubTitle[count - 1],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Color(0xff757575)),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath + "Yes.png",
                width: 10,
                color: getPointColor(1),
              ),
              const SizedBox(width: 5),
              Image.asset(
                imagePath + "Yes.png",
                color: getPointColor(2),
                width: 10,
              ),
              const SizedBox(width: 5),
              Image.asset(
                imagePath + "Yes.png",
                color: getPointColor(3),
                width: 10,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                if (count > 1)
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (count > 1) {
                            setState(() {
                              count--;
                            });
                          }
                        },
                        child: Container(
                          height: 43,
                          width: 104,
                          child: Center(
                            child: Text(
                              'Back',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                    ],
                  ),
                Expanded(
                  child: CustomButton(
                    text: 'Next',
                    onTap: () {
                      if (count < 3) {
                        setState(() {
                          count++;
                        });
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          indicatorImage,
        ],
      ),
    );
  }
}
