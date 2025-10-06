import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:homehaven/core/helpers/dio_helper.dart';
import 'package:homehaven/features/auth/data/models/login_model/login_model.dart';
import 'package:homehaven/features/home/presentation/views/home_view.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(LoginModel loginModel) async {
    emit(AuthLoading());
    try {
      final response = await DioHelper.postData(
        path: "login",
        body: {"email": loginModel.email, "password": loginModel.password},
      );

      if (response.data["status_code"] == 200) {
        Get.snackbar(
          "Success",
          response.data["message"],
          backgroundColor: Colors.green,
        );
        emit(AuthSuccess());
        //HiveHelper.setToken(loginModel.)
        Get.to(HomeView());
      } else {
        Get.snackbar(
          colorText: Colors.white,
          "Error",
          response.data["message"],
          backgroundColor: Colors.red,
        );
        emit(AuthFailed());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      //print(e.toString());
      emit(AuthFailed());
    }
  }

  void loginWithFirebase(LoginModel loginModel) async {
    emit(AuthLoading());

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: loginModel.email,
            password: loginModel.password,
          );

      emit(AuthSuccess());
      Get.to(HomeView());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      emit(AuthFailed());
    }
  }
}
