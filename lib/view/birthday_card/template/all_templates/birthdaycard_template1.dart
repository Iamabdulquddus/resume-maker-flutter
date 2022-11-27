import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/images.dart';
import '../../../../constants/style.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;

class BirthdayCardTemplate1 extends StatefulWidget {
  const BirthdayCardTemplate1({Key? key}) : super(key: key);

  @override
  State<BirthdayCardTemplate1> createState() => _BirthdayCardTemplate1State();
}

class _BirthdayCardTemplate1State extends State<BirthdayCardTemplate1> {
  GlobalKey globalKey = GlobalKey();
  static Color templateDark = const Color(0xff7c6148);
  static Color templateLight = const Color(0xffcba882);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightColor,
        appBar: AppBar(
          title: Text(
            "Birthday Card Template 1",
            style: MyTextStyles.headingxSmallBoldWhite,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RepaintBoundary(
              key: globalKey,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/birthdaycard/birthdaycard1.png',
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width - 150,
                            height: 230,
                            decoration: BoxDecoration(
                              color: Colors.white,
                                border:
                                    Border.all(color: Colors.white70  , width: 10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset.zero,
                                spreadRadius: 5,
                                blurRadius: 10
                              ),
                            ]
                            ),

                            child: Image.asset(
                              resumeBro,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 70,),
                        Text('Dear, Name Birthday person', style: TextStyle(fontSize: 16, color: templateDark, fontWeight: FontWeight.bold), maxLines: 1,),
                        SizedBox(height: 70,),
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 150,
                            child: Text('Wishing you a beautiful day with good health and happiness forever. Happy Birthday.', style: TextStyle(fontSize: 16, color: templateLight, fontWeight: FontWeight.bold), maxLines: 3, textAlign: TextAlign.center,),),
                        SizedBox(height: 10,),
                        Text('Regards, Name of person Wishing', style: TextStyle(fontSize: 13, color: templateDark, fontWeight: FontWeight.bold), maxLines: 1,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final RenderRepaintBoundary boundary =
                            globalKey.currentContext!.findRenderObject()!
                                as RenderRepaintBoundary;
                        final ui.Image image =
                            await boundary.toImage(pixelRatio: 4.0);
                        final ByteData? byteData = await image.toByteData(
                            format: ui.ImageByteFormat.png);
                        final Uint8List pngBytes =
                            byteData!.buffer.asUint8List();
                        print(pngBytes);
                        final result = await ImageGallerySaver.saveImage(
                            byteData.buffer.asUint8List());
                        print(result);
                        if (!mounted) return;
                        savedToDevice(context);
                        Navigator.pop(context);
                      },
                      child: const Text("Save to Device"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void savedToDevice(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Image saved successfully'),
      ),
    );
  }
}
