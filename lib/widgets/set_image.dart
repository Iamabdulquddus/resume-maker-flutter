import 'dart:typed_data';

import 'package:flutter/material.dart';

class SetImageFromMemery extends StatelessWidget {
  SetImageFromMemery({Key? key,required this.height,required this.widget,required this.image}) : super(key: key);
  Uint8List? uint8list;
  int height;
  int widget;
  var image;


  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      image,
      height: 100,
      width: 100,
      fit: BoxFit.cover,
    );
  }
}
