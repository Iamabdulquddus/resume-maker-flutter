// import 'dart:html' as File;
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../constants/style.dart';
import '../responsive.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  FilePickerResult? result;
  String? fileName;
  PlatformFile? pickedFile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickImage() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform.pickFiles(
        dialogTitle: 'Select profile picture',
        type: FileType.custom,
        allowedExtensions: ['jpg'],
        allowMultiple: false,
      );

      if (result != null) {
        fileName = result!.files.first.name;
        pickedFile = result!.files.first;
        fileToDisplay = File(
          pickedFile!.path.toString(),
        );
        print("fileName: $fileName");
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("error loading the file");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              pickImage();
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
                    offset: Offset(-6.0, -6.0),
                    blurRadius: 16.0,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(6.0, 6.0),
                    blurRadius: 16.0,
                  ),
                ],
                color: lightColor,
                borderRadius: BorderRadius.circular(20),
              ),
              width: Responsive.isMobile(context) ? size.width/2.3 : 300,
              height: Responsive.isMobile(context) ? size.width/2.3 : 300,
              child: pickedFile != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        fileToDisplay!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(
                      color: secondary,
                      Icons.camera_alt,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

