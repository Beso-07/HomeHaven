import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homehaven/core/constnts/assets.dart';
import 'package:homehaven/core/constnts/colors.dart';
import 'package:homehaven/features/auth/data/models/login_model/login_model.dart';
import 'package:homehaven/features/auth/presentation/views/register_view.dart';
import 'package:homehaven/features/auth/presentation/views_models/auth_cubit/auth_cubit.dart';
import 'package:homehaven/core/widgets/custom_button.dart';
import 'package:homehaven/features/auth/presentation/widgets/custom_login_with.dart';
import 'package:homehaven/features/auth/presentation/widgets/custom_text_field.dart';

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
          // if (state is AuthSuccess) {
          //   Get.snackbar(
          //     "Success",
          //     "Account created successfully",
          //     backgroundColor: Colors.green,
          //   );
          //   Get.to(HomeView());
          // }
          // if (state is AuthFailed) {
          //   Get.snackbar(
          //     "Error",
          //     "There is an error, please try again",
          //     backgroundColor: Colors.red,
          //   );
          //}
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
                        color: AppColors.kTextColor,
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
                          style: TextStyle(
                            color: AppColors.kPrimaryColor,
                            fontSize: 16,
                          ),
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
                            cubit.loginWithFirebase(
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
                      text: 'Login with Google',
                    ),
                    SizedBox(height: 16),
                    CustomLoginWith(
                      name: AssetsPath.facebook,
                      text: 'Login with Facebook',
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
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
                                builder: (context) => RegisterView(),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: AppColors.kPrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 180),
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
