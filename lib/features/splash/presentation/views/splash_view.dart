import 'package:flutter/material.dart';
import 'package:homehaven/core/constnts/assets.dart';
import 'package:homehaven/core/constnts/colors.dart';
import 'package:homehaven/features/onboarding/presentation/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.linearGradientColor),
        child: Center(child: Image.asset(AssetsPath.logo)),
      ),
    );
  }
}
