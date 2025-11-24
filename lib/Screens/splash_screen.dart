import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kids_play_mob_app/Screens/home_screen.dart';
import 'package:kids_play_mob_app/Screens/login/login.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        var box = Hive.box('app');

        bool isOldUser = box.get('isOldUser', defaultValue: false);

        Timer(const Duration(seconds: 3), () {
          if (isOldUser) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false);
          } else {
            box.put('isOldUser', true);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
                (route) => false);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [Color(0xffFD5602), Color(0xffFE6E00)])),
        child: Column(
          children: [
            Lottie.asset('Assets/animation/monkey.json', height: 250),
            Image.asset('Assets/Images/logo.png')
          ],
        ),
      ),
    );
  }
}
