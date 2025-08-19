import 'package:flutter/material.dart';
import 'package:homehaven/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homehaven/screens/welcome/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: linearGradientColor),
        child: Center(child: SvgPicture.asset(imagePath + "Logo.svg")),
      ),
    );
  }
}
