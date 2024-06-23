
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:religion_app/view/screen/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer( const Duration(seconds: 5), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen(),));
    });
    return Scaffold(
      body: Center(
        child: Image.asset('asset/img/splash/img.png'),
      ),
    );
  }
}
