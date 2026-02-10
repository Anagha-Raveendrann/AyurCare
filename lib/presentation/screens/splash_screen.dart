import 'dart:ui';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// Background Image
          Image.asset(
            'assets/a8b961715b401b955622ed1c02596fecdc965edc.jpg',
            fit: BoxFit.cover,
          ),

          /// Blur Effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: Colors.black.withOpacity(0.35),
            ),
          ),

          /// Center Logo
          Center(
            child: Image.asset(
              'assets/Asset 1 2.png',
              height: 120,
              width: 120,
            ),
          ),
        ],
      ),
    );
  }
}
