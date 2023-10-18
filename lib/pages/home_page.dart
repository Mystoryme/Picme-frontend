import 'package:flutter/material.dart';
import 'package:picme/pages/add_image_page.dart';
import 'package:picme/pages/check_image_page.dart';
import 'package:picme/pages/home/home.dart';
import 'package:picme/pages/notification_page.dart';
import 'package:picme/pages/profile_page.dart';
import 'package:picme/pages/search_page.dart';
import 'package:picme/widget/home/home_dropdown.dart';

import 'package:picme/widget/home/buttonbar.dart';
import 'package:picme/utils/colors.dart';

//import 'package:picme/widget/home/HomeDropdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picme/widget/postcard/postcard.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            constraints: BoxConstraints.expand(),
            child: _buildPage(_currentIndex)),
      ),
      bottomNavigationBar: Home_bar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget _buildPage(int index) {
  switch (index) {
    case 0:
      return HomeTab();
    case 1:
      return AddImagePage();
    case 2:
      return const NotificationPage();
    case 3:
      return ProfilePage();
    default:
      return Homepage();
  }
}
