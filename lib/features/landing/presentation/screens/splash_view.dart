import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../resources/resources.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      push();
    });
  }

  push() {
    context.go("/LoginView");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.white,
      body: Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: R.colors.black,
        ),
      ),
    );
  }
}
