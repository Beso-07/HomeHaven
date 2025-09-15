import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:homehaven/constant.dart';
import 'package:homehaven/cubit/Auth/auth_cubit.dart';
import 'package:homehaven/model/register_model.dart';
import 'package:homehaven/widgets/custom_button.dart';
import 'package:homehaven/widgets/custom_login_with.dart';
import 'package:homehaven/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
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
                      'Create Account',
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Fill in your details below to get started on a seamless shopping experience.',
                      style: TextStyle(color: Color(0xff757575), fontSize: 16),
                    ),
                    SizedBox(height: 32),
                    CustomTextField(
                      controller: _firstNameController,
                      hintText: 'First Name',
                      prefixIcon: Icons.person,
                      // validator: (value) {
                      //   if (value == null || value!.isEmpty) {
                      //     return 'Field is required';
                      //   }
                      // },
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      controller: _lastNameController,
                      hintText: 'Last Name',
                      prefixIcon: Icons.person,
                      // validator: (value) {
                      //   if (value == null || value!.isEmpty) {
                      //     return 'Field is required';
                      //   }
                      // },
                    ),
                    SizedBox(height: 16),
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
                    Text(
                      'By clicking Create Account, you acknowledge you have read and agreed to our Terms of Use and Privacy Policy',
                      style: TextStyle(color: Color(0xff757575), fontSize: 16),
                    ),
                    SizedBox(height: 24),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        final cubit = context.read<AuthCubit>();
                        if (state is AuthLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return CustomButton(
                          text: 'Creat Account',
                          onTap: () {
                            _key.currentState!.validate();
                            // cubit.register(
                            //   RegisterModel(
                            //     firstName: _firstNameController.text,
                            //     lastName: _lastNameController.text,
                            //     email: _emailController.text,
                            //     password: _passwordController.text,
                            //   ),
                            // );
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
                      text: 'Continue with Google',
                    ),
                    SizedBox(height: 16),
                    CustomLoginWith(
                      imageName: 'facebook',
                      text: 'Continue with Facebook',
                    ),
                    SizedBox(height: 32),

                    SizedBox(height: 40),
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
