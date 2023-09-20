import 'package:flutter/material.dart';
import 'package:picme/widget/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = "/profile_page";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: (Profile()),
    );
  }
}
