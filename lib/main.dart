import 'package:flutter/material.dart';
import 'package:homehaven/screens/welcome/splash_screen.dart';

void main() {
  runApp(HomeHaven());
}

class HomeHaven extends StatelessWidget {
  const HomeHaven({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
