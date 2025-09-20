import 'package:hive/hive.dart';
import 'package:homehaven/features/auth/data/models/register_model/register_model.dart';

class HiveHelper {
  static const registerData = "RegisterData";
  static Future setLoginData(RegisterModel loginModel) async {
    await Hive.box(registerData).put(registerData, loginModel);
  }

  static Future setRegisterData(RegisterModel registerModel) async {
    await Hive.box(registerData).put(registerData, registerModel);
  }

  static getLoginData() {
    if (Hive.box(registerData).isNotEmpty) {
      RegisterModel result = Hive.box(registerData).get(registerData);
      //print("=============" + result.toJson());
    }
  }
}
