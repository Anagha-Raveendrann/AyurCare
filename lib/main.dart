import 'package:ayurcare/presentation/routes/routes.dart';
import 'package:ayurcare/screens/Login_screen.dart';
import 'package:ayurcare/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
  // initialRoute: AppRoutes.splash,
  // routes: {
  //   AppRoutes.splash: (_) => SplashScreen(),
  //   AppRoutes.login: (_) => const LoginScreen(),
  // },


    
      title: 'AyurCare',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen()
    );
  }
}
