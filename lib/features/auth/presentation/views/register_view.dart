import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:homehaven/core/constnts/assets.dart';
import 'package:homehaven/core/constnts/colors.dart';
import 'package:homehaven/core/widgets/custom_button.dart';
import 'package:homehaven/features/auth/presentation/views/login_view.dart';
import 'package:homehaven/features/auth/presentation/views_models/auth_cubit/auth_cubit.dart';
import 'package:homehaven/features/auth/presentation/widgets/custom_login_with.dart';
import 'package:homehaven/features/auth/presentation/widgets/custom_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
                        color: AppColors.kTextColor,
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
                        // final cubit = context.read<AuthCubit>();
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
                            AssetsPath.line,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '  OR  ',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.kTextColor,
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            AssetsPath.line,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    CustomLoginWith(
                      name: AssetsPath.google,
                      text: 'Continue with Google',
                    ),
                    SizedBox(height: 16),
                    CustomLoginWith(
                      name: AssetsPath.facebook,
                      text: 'Continue with Facebook',
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: AppColors.kTextColor,
                            fontSize: 16,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: AppColors.kPrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Image.asset(AssetsPath.indicator),
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
