import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newsity/utils/utils.dart';

import '../constants/color_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 1),
      () async {
        await Hive.openBox("auth");
        if (box.get('email') != '' && box.get('password') != '') {
          Get.offAndToNamed('/homePage');
        }
        Get.offAndToNamed('/signin_signup');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepPurple,
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: Get.width * 0.5,
        ),
      ),
    );
  }
}
