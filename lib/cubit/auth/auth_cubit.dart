import 'package:bloc/bloc.dart';
import 'package:homehaven/cubit/auth/auth_cubit.dart';
import 'package:homehaven/helper/dio_helper.dart';
import 'package:homehaven/helper/hive_helper.dart';
import 'package:homehaven/model/login_model.dart';
import 'package:homehaven/model/register_model.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  void login(LoginModel loginModel) async {
    emit(AuthLoading());

    // try {
    //   await Future.delayed(Duration(seconds: 3));
    //   if (registerModel.firstName == "mahmoud" &&
    //       registerModel.lastName == 'bassem' &&
    //       registerModel.email == "mahmoud@gmail.com" &&
    //       registerModel.password == "123456") {
    //     await HiveHelper.setLoginData(registerModel);
    //     HiveHelper.getLoginData();
    //     emit(AuthSuccess());
    //   } else {
    //     emit(AuthFailed());
    //   }
    // }

    try {
      final response = await DioHelper.postData(
        path: "login",
        body: {"email": loginModel.email, "password": loginModel.password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        //await HiveHelper.setLoginData(loginModel);
        print(response.data);
        emit(AuthSuccess());
      } else {
        emit(AuthFailed());
      }
    } catch (e) {
      print("Login error: $e");
      emit(AuthFailed());
    }
  }
}
