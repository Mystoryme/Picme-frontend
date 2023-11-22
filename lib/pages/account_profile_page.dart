import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/profile.dart';
import 'package:picme/widget/account_profile/account_profile_bar.dart';
import 'package:picme/widget/account_profile/account_section.dart';
import 'package:picme/widget/profile/profilebar.dart';
import 'package:picme/widget/profile/profilesec.dart';

class AccountProfilePage extends StatefulWidget {
  const AccountProfilePage({Key? key, required this.userId}) : super(key: key);
  final int userId;

  static const routeName = "/account_profile_page";

  @override
  State<AccountProfilePage> createState() => _AccountProfilePageState();
}

class _AccountProfilePageState extends State<AccountProfilePage> {
  Profile? profile;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    Caller.dio.post("/insight/view_profile", data: {
      "userId": widget.userId,
    }).then((response) {

    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });

    Caller.dio.post("/profile/profile_search", data: {
      "userId": widget.userId,
    }).then((response) {
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
                children: [
                 AccountSection(profile: profile!),
                 AccountProfileBar(userId: widget.userId,),
          ],
        ),
      ),
    )));
  }
}
