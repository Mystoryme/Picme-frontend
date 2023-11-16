import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picme/classes/caller.dart';
import 'package:picme/models/profile.dart';
import 'package:picme/pages/profile_page.dart';
import 'package:picme/widget/editprofile/edit_profile.dart';
import 'package:picme/widget/editprofile/head_edit_profile.dart';
import 'package:picme/widget/editprofile/textform_edit_profile.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key, required this.reloadProfile}) : super(key: key);
  static const routeName = "/edit_profile_page";
  final VoidCallback reloadProfile;
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Profile? profile;
  XFile? _pickedImage;

  final TextEditingController _username = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  final TextEditingController _contact = TextEditingController();

  void callEdit() async {
    Caller.dio.post("/profile/edit", data: {
      "username": _username.text,
      "bio": _bio.text,
      "contact": _contact.text,
    }).then((response) async {
      widget.reloadProfile();
      Navigator.pop(context);
    }).onError((DioException error, _) {
      // * Apply default error handling
      Caller.handle(context, error);
    });
  }

  void callEditAvatar() {
    // Post multipart form using Dio and senf _pickedImage in key of file
    FormData formData = FormData.fromMap({
      "file": MultipartFile.fromFileSync(_pickedImage!.path,
          filename: _pickedImage!.path.split("/").last)
    });

    Caller.dio.post("/profile/avatar", data: formData).then((response) {
      SnackBar snackBar = const SnackBar(
        content: Text('Successfully edited!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).onError((DioException error, _) {
      Caller.handle(context, error);
    });
  }

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
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            HeadEditProfile(
              callEdit: callEdit,
              callEditAvatar: callEditAvatar,
            ),
            EditProfile(
                pickedImage: _pickedImage,
                setPickedImage: (XFile f) {
                  setState(() {
                    _pickedImage = f;
                  });
                },
                profile: profile!),
            TextFormEditProfile(
              username: _username,
              bio: _bio,
              contact: _contact,
              profile: profile!,
            ),
          ],
        ),
      ),
    );
  }
}
