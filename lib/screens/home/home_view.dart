import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home View')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/396e9/MainAfter.jpg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
