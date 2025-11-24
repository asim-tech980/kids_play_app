import 'package:flutter/material.dart';
import 'package:kids_play_mob_app/Screens/login/inputwraperlogin.dart';
import 'package:lottie/lottie.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.deepOrange,
            Colors.deepOrangeAccent,
            Colors.orange
          ])),
          child: Column(
            children: [
              Lottie.asset('Assets/animation/fruits.json', height: 200),
              const Center(
                child: Text(
                  'Login ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              // Header(),

              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    )),
                child: const InputWraperLogin(),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
