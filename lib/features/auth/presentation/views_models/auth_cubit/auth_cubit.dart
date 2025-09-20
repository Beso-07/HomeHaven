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
      print(e.toString());
      emit(AuthFailed());
    }
  }
}
