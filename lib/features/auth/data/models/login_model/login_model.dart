import 'package:hive_flutter/hive_flutter.dart';

part 'login_model.g.dart';
@HiveType(typeId: 0)
class LoginModel extends HiveObject {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String password;

  LoginModel({required this.email, required this.password});

  String toJson() {
    return """
    { email: $email ,
    password: $password,
    }
       
    """;
  }
}
