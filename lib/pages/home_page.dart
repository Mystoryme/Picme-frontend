import 'package:flutter/material.dart';
import 'package:picme/widget/Homebar.dart';
import 'package:picme/utils/colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.0),
        color: Colors.amber[600],
      ),
      bottomNavigationBar: Home_bar(),
    );
  }
}
