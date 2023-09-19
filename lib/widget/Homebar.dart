import 'package:flutter/material.dart';
import 'package:picme/utils/colors.dart';

class Home_bar extends StatefulWidget {
  const Home_bar({super.key});

  @override
  State<Home_bar> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<Home_bar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedIconTheme: IconThemeData(color: PicmeColors.mainColor, size: 38),
      selectedItemColor: PicmeColors.mainColor,
      unselectedIconTheme: IconThemeData(
        color: Colors.amberAccent,
      ),
      unselectedItemColor: PicmeColors.grayWhite,
      iconSize: 33,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex, // Added currentIndex here
      onTap: _onItemTapped, // Added onTap here
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined), label: ''),
      ],
    );
  }
}
