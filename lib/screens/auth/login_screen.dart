import 'package:flutter/material.dart';
import 'package:homehaven/constant.dart';
import 'package:homehaven/screens/auth/register_screen.dart';
import 'package:homehaven/widgets/custom_button.dart';
import 'package:homehaven/widgets/custom_login_with.dart';
import 'package:homehaven/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 44),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Enter your email to start shopping and get awesome deals today!',
                  style: TextStyle(color: Color(0xff757575), fontSize: 16),
                ),
                SizedBox(height: 32),
                CustomTextField(
                  hintText: 'Email',
                  prefixIcon: Icons.email,
                  validator: (value) {
                    if (value == null || value!.isEmpty) {
                      return 'Field is required';
                    } else if (!value!.contains('@')) {
                      return 'Enter a correct email';
                    }
                  },
                ),
                SizedBox(height: 16),
                CustomTextField(
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value!.isEmpty) {
                      return 'Field is required';
                    } else if (value!.length < 6) {
                      return 'Password must be al least 6 letters';
                    }
                  },
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Forgot your password?',
                      style: TextStyle(color: kPrimaryColor, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                CustomButton(
                  text: 'Log In',
                  onTap: () {
                    _key.currentState!.validate();
                  },
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        imagePath + 'line.png',
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '  OR  ',
                      style: TextStyle(fontSize: 12, color: kTextColor),
                    ),
                    Expanded(
                      child: Image.asset(
                        imagePath + 'line.png',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                CustomLoginWith(imageName: 'google', text: 'Login with Google'),
                SizedBox(height: 16),
                CustomLoginWith(
                  imageName: 'facebook',
                  text: 'Login with Facebook',
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(color: kTextColor, fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: kPrimaryColor, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 200),
                indicatorImage,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
