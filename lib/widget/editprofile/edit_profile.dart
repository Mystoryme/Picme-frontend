import 'package:flutter/material.dart';
import 'package:picme/utils/colors.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage("assets/profile.jpg"),
        ),
        Positioned(
          bottom: 8.0,
          right: 12.0,
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
      ],
    );
  }
}
