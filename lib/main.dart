import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:homehaven/core/helpers/dio_helper.dart';
import 'package:homehaven/core/helpers/hive_helper.dart';
import 'package:homehaven/features/auth/data/models/register_model/register_model.dart';
import 'package:homehaven/features/splash/presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(RegisterModelAdapter());
  await Hive.openBox(HiveHelper.registerData);
  DioHelper.intialize();
  runApp(HomeHaven());
}

class HomeHaven extends StatelessWidget {
  const HomeHaven({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
