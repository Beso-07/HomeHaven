import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
          CircleAvatar(backgroundImage: NetworkImage('url'),radius: 50,),

          Column(
            children: [
              Text('Name: mahmoud bassem'),
              SizedBox(height: 20,),
              Text('Email: mahmoudbassem@gmail.com'),
              SizedBox(height: 20,),
              Text('Phone: 01112764146'),
              SizedBox(height: 20,),
            ],
          )
        ],
      ),
    );
  }
}