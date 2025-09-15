import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:homehaven/helper/dio_helper.dart';
import 'package:homehaven/helper/hive_helper.dart';
import 'package:homehaven/model/register_model.dart';
import 'package:homehaven/screens/home/home_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:homehaven/screens/welcome/splash_screen.dart';

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
      home: SplashScreen(),
    );
  }
}
