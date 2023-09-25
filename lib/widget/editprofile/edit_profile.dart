// import 'dart:js';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:picme/utils/colors.dart';
// import 'package:uuid/uuid.dart';

class EditProfile extends StatefulWidget {
//  final String image;
//   final String? notDeleteable;
//   final double radius;
//   final Function(String)? onChanged;
//   final bool readOnly;
//   final bool showLoadingStatus;
//   final bool showBorder;
//   const ImageInput({
//     Key? key,
//     required this.image,
//     this.notDeleteable,
//     this.onChanged,
//     this.radius = 120.0,
//     this.readOnly = false,
//     this.showLoadingStatus = true,
//     this.showBorder = false
//   }) : super(key: key);

   @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late Future<String?> imageURL;

  // Future<String?> _getImageURL() async {
  //   return Future.value(await FirebaseStorage.instance
  //       .refFromURL(widget.image)
  //       .getDownloadURL());
  // }

  // Future<void> _handleInput() async {
  //   FilePickerResult? result =
  //       await FilePicker.platform.pickFiles(type: FileType.image);
  //   if (result != null) {
  //     File file = File(result.files.single.path!);
  //     Uint8List fileBytes = await file.readAsBytes();
  //     if (defaultTargetPlatform == TargetPlatform.iOS ||
  //         defaultTargetPlatform == TargetPlatform.android) {
  //       fileBytes = await FlutterImageCompress.compressWithList(
  //         fileBytes,
  //         minHeight: 1920,
  //         minWidth: 1080,
  //       );
  //     }
  //     const uuid = Uuid();
  //     while (true) {
  //       String fileName = uuid.v1();
  //       String path = 'gs://cs21-voto.appspot.com/uploads/$fileName';
  //       try {
  //         await FirebaseStorage.instance.refFromURL(path).getDownloadURL();
  //         debugPrint('duplicate filename exists, getting a new name...');
  //       } on FirebaseException catch (e) {
  //         if (e.code == 'object-not-found') {
  //           await FirebaseStorage.instance.refFromURL(path).putData(fileBytes);
  //           widget.onChanged?.call(path);
  //           break;
  //         }
  //       }
  //     }
  //   }
  // }

  // Future<void> _deletePreviousImage(String? previousImage) async {
  //   /***
  //    * Delete previousImage if not in /dummy folder
  //    */
  //   if (widget.readOnly || previousImage == widget.notDeleteable) return;
  //   if (previousImage != null && previousImage.split('/')[3] != 'dummy') {
  //     FirebaseStorage.instance.refFromURL(previousImage).delete();
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   imageURL = _getImageURL();
  // }

  // @override
  // void didUpdateWidget(covariant ImageInput oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (widget.image.isNotEmpty && widget.image != oldWidget.image) {
  //     _deletePreviousImage(oldWidget.image);
  //   }
  //   imageURL = _getImageURL();
  // }

  // @override
  // void deactivate() {
  //   widget.onChanged?.call('');
  //   super.deactivate();
  // }

  // final ImagePicker _picker = ImagePicker();

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
          child: InkWell(
            onTap: () {
              
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

