import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picme/utils/colors.dart';

class ImportImage extends StatefulWidget {
  const ImportImage({Key? key}) : super(key: key);

  @override
  _ImportImageState createState() => _ImportImageState();
}

class _ImportImageState extends State<ImportImage> {
  XFile? _pickedImage;

  Future<void> _pickImageFromGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      // User cancelled image selection
      return;
    }

    setState(() {
      _pickedImage = image;
    });
  }

  Future<void> _deletePickedImage() async {
    if (_pickedImage == null) return;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Image'),
          content: Text('Are you sure you want to delete this image?'),
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
                setState(() {
                  _pickedImage = null;
                });
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
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: GestureDetector(
        onTap: () {
          if (_pickedImage != null) {
            _deletePickedImage();
          } else {
            _pickImageFromGallery(context);
          }
        },
        child: Container(
          height: 320,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: PicmeColors.grayWhite,
          ),
          child: _pickedImage == null
              ? IconButton(
                  icon: const Icon(
                    Icons.add_photo_alternate,
                    color: Colors.black54,
                    size: 100,
                  ),
                  onPressed: () {
                    _pickImageFromGallery(context);
                  },
                )
              : Image.file(
                  File(_pickedImage!.path),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
