import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:picme/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash()
    );
  }
}