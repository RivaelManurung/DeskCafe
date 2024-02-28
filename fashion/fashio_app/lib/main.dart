import 'package:fashio_app/users/authentication/login_screen.dart';
import 'package:fashio_app/users/dashboard/splash_screen.dart';
import 'package:fashio_app/users/food/popular_food_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Coffee app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        builder: (context, dataSnapShot) {
          return PopularFoodDetail();
        },
        future: null,
      ),
    );
  }
}
