import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class SetImageFromMemery extends StatelessWidget {
  SetImageFromMemery({Key? key,required this.height,required this.widget,required this.image}) : super(key: key);
  Uint8List? uint8list;
  int height;
  int widget;
  var image;
  File? file;


  @override
  Widget build(BuildContext context) {
    List<int> list = '$image'.codeUnits;
    Uint8List bytes = Uint8List.fromList(list);
    file = File.fromRawPath(bytes);
    print("image=> $image");

    return  Image.file(
      file!,
      height: 100,
      width: 100,
      fit: BoxFit.cover,
    );
  }
}
