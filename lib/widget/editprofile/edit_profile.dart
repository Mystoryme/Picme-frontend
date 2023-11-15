// import 'dart:js';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picme/models/profile.dart';
import 'package:picme/utils/colors.dart';

class EditProfile extends StatefulWidget {
  final XFile? pickedImage;
  final Function setPickedImage;
  final Profile profile;

  const EditProfile(
      {Key? key,
      required this.pickedImage,
      required this.setPickedImage,
      required this.profile})
      : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late Future<String?> imageURL;
  Future<void> _pickImageFromGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      // User cancelled image selection
      return;
    }

    widget.setPickedImage(image);
  }

  Future<void> _deletePickedImage() async {
    if (widget.pickedImage == null) return;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Image'),
          content: const Text('Are you sure you want to delete this image?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'No',
                style: TextStyle(color: PicmeColors.grayBlack),
              ),
            ),
            TextButton(
              onPressed: () {
                widget.setPickedImage(null);
                Navigator.pop(context);
              },
              child: Text(
                'Yes',
                style: TextStyle(color: PicmeColors.mainColor),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(80),
            color: PicmeColors.grayWhite,
          ),
          child: widget.pickedImage == null
              ? Image.network(
                  widget.profile.avatarUrl ??
                      "https://cdn.crispedge.com/5d76cb.png",
                  fit: BoxFit.contain,
                )
              : Image.file(
                  File(widget.pickedImage!.path),
                  fit: BoxFit.contain,
                ),
        ),
        Positioned(
          bottom: 8.0,
          right: 12.0,
          child: InkWell(
            onTap: () {
              if (widget.pickedImage != null) {
                _deletePickedImage();
              } else {
                _pickImageFromGallery(context);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: PicmeColors.mainColor,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
