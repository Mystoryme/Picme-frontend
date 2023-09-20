import 'package:flutter/material.dart';
import 'package:picme/widget/editprofile/edit_profile.dart';
import 'package:picme/widget/editprofile/head_edit_profile.dart';
import 'package:picme/widget/editprofile/textform_edit_profile.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key}) : super(key: key);
  static const routeName = "/edit_profile_page";

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            HeadEditProfile(),
            EditProfile(),
            TextFormEditProfile(
              username: _username,
              bio: _bio,
              contact: _contact,
            ),
          ],
        ),
      ),
    );
  }
}
