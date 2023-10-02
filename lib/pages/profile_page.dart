import 'package:flutter/material.dart';
import 'package:picme/widget/postcard/postcard_owner.dart';
import 'package:picme/widget/profile/profilesec.dart';
import 'package:picme/widget/profile/selection.dart';
import 'package:picme/widget/profile/sortby.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = "/profile_page";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
      child: Column(
        children: [Profile(), Selection(), SortBy(), PostCardOwner()],
      ),
    )));
  }
}
