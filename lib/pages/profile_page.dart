import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/profile.dart';
import 'package:picme/widget/postcard/postcard.dart';
import 'package:picme/widget/postcard/postcard_grid.dart';
import 'package:picme/widget/postcard/postcard_owner.dart';
import 'package:picme/widget/profile/profilesec.dart';
import 'package:picme/widget/profile/profilebar.dart';
import 'package:picme/widget/profile/sortby.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile? profile;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    Caller.dio.get("/profile/info").then((response) {
      setState(() {
        profile = Profile.fromJson(response.data["data"]);
      });
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (profile == null) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CircularProgressIndicator()],
      );
    }

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [ProfileSection(profile: profile!), ProfileBar()]),
      ),
    )));
  }
}
