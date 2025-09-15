import 'package:hive/hive.dart';

part 'register_model.g.dart';
@HiveType(typeId: 0)
class RegisterModel extends HiveObject {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String password;

  
  RegisterModel({required this.firstName, required this.lastName, required this.email, required this.password});

    String toJson() {
    return """
    { name: $firstName $lastName,
    email: $email ,
    password: $password,
    }
       
    """;
  }
}
