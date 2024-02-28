import 'dart:async';

import 'package:fashio_app/users/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Get.to(LoginScreen());
    });
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Container(
          width: 150, // Sesuaikan dengan ukuran yang diinginkan
          height: 150, // Sesuaikan dengan ukuran yang diinginkan
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("images/logo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
