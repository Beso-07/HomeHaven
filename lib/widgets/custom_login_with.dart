import 'package:flutter/material.dart';
import 'package:homehaven/constant.dart';

class CustomLoginWith extends StatelessWidget {
  const CustomLoginWith({super.key, required this.imageName, required this.text});
  final String imageName;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kPrimaryColor, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath + '$imageName.png', width: 16, height: 16),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
