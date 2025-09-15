import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:homehaven/constant.dart';
import 'package:homehaven/cubit/Auth/auth_cubit.dart';
import 'package:homehaven/model/login_model.dart';
import 'package:homehaven/screens/auth/register_view.dart';
import 'package:homehaven/screens/home/home_view.dart';
import 'package:homehaven/widgets/custom_button.dart';
import 'package:homehaven/widgets/custom_login_with.dart';
import 'package:homehaven/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Get.snackbar(
              "Success",
              "Account created successfully",
              backgroundColor: Colors.green,
            );
            Get.to(HomeView());
          }
          if (state is AuthFailed) {
            Get.snackbar(
              "Error",
              "There is an error, please try again",
              backgroundColor: Colors.red,
            );
          }
        },
        child: Scaffold(
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
                      controller: _emailController,
                      hintText: 'Email',
                      prefixIcon: Icons.email,
                      // validator: (value) {
                      //   if (value == null || value!.isEmpty) {
                      //     return 'Field is required';
                      //   } else if (!value!.contains('@')) {
                      //     return 'Enter a correct email';
                      //   }
                      // },
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      isPassword: true,
                      // validator: (value) {
                      //   if (value == null || value!.isEmpty) {
                      //     return 'Field is required';
                      //   } else if (value!.length < 6) {
                      //     return 'Password must be al least 6 letters';
                      //   }
                      // },
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
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        final cubit = context.read<AuthCubit>();
                        if (state is AuthLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return CustomButton(
                          text: 'Log In',
                          onTap: () {
                            _key.currentState!.validate();
                            cubit.login(
                              LoginModel(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                          },
                        );
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
                    CustomLoginWith(
                      imageName: 'google',
                      text: 'Login with Google',
                    ),
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
                                builder: (context) => RegisterView(),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                            ),
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
        ),
      ),
    );
  }
}
