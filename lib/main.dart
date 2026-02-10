import 'package:ayurcare/presentation/screens/login_screen.dart';
import 'package:ayurcare/presentation/screens/patient_list_screen.dart';
import 'package:ayurcare/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AyurCare',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PatientListScreen()
    );
  }
}
