import 'package:flutter/material.dart';
import 'package:picme/widget/postcard/postcard.dart';
import 'package:picme/widget/postcard/postcard_grid.dart';
import 'package:picme/widget/postcard/postcard_owner.dart';
import 'package:picme/widget/profile/profilesec.dart';
import 'package:picme/widget/profile/profilebar.dart';
import 'package:picme/widget/profile/sortby.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = "/profile_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Profile(), ProfileBar()]),
      ),
    )));
  }
}
