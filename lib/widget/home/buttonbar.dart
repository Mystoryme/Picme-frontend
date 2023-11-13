import 'package:flutter/material.dart';
import 'package:picme/pages/add_image_page.dart';
import 'package:picme/pages/profile_page.dart';
import 'package:picme/utils/colors.dart';
import 'package:picme/pages/home_page.dart';

class Home_bar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  Home_bar({required this.currentIndex, required this.onTap});

  @override
  State<Home_bar> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<Home_bar> {
  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    widget.onTap(index); // Notify the parent widget about the change
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedIconTheme: IconThemeData(color: PicmeColors.mainColor, size: 38),
      selectedItemColor: PicmeColors.mainColor,
      unselectedIconTheme: IconThemeData(color: Color(0xffA0A5D8)),
      unselectedItemColor: PicmeColors.grayWhite,
      iconSize: 33,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: widget.currentIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home_outlined),
            label: '',
            activeIcon: Icon(Icons.home)),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: '',
            activeIcon: Icon(Icons.notifications)),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
            activeIcon: Icon(Icons.person)),
      ],
    );
  }
}
