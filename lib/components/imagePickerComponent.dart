import 'dart:io';

import 'package:bes_mobile/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerComponent extends StatefulWidget {
  final String labelImage;

  const ImagePickerComponent({super.key, required this.labelImage});

  @override
  State<ImagePickerComponent> createState() => _ImagePickerComponentState();
}

class _ImagePickerComponentState extends State<ImagePickerComponent> {
  final ImagePicker imagePicker = ImagePicker();

  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final XFile? pickedFile =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Row(
        children: [
          _pickedImage != null
              ? CircleAvatar(
            maxRadius: 50,
            backgroundImage: FileImage(File(_pickedImage!.path)),
          )
              : CircleAvatar(
            maxRadius: 50,
            backgroundColor: blueLigthColor,
            child: const Icon(
              Icons.camera_alt,
              color: CupertinoColors.systemGrey2,
              size: 50,
            ),
          ),
          const SizedBox(width: 20),
          Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Text(
                    widget.labelImage,
                    style: TextStyle(fontSize: 20, color: blueColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
