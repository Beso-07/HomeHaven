import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff156651);
const kSecondaryColor = Color(0xffEBB65B);
const kTextColor = Color(0xff404040);
const linearGradientColor = LinearGradient(
  colors: [Color(0xFF1A7F65), Color(0xFF115543)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const imagePath = "assets/images/";
const List<String> onboardingTitle = [
  "Online Home Store and Furniture",
  "Delivery Right to Your Doorstep",
  "Get Support From Our Skilled Team",
];
const List<String> onboardingSubTitle = [
  "Discover all style and budgets of furniture, appliances, kitchen, and more from 500+ brands in your hand.",
  "Sit back, and enjoy the convenience of our drivers delivering your order to your doorstep.",
  "If our products don't meet your expectations, we're available 24/7 to assist you.",
];

final indicatorImage =  Image.asset("assets/images/indicator.png");
