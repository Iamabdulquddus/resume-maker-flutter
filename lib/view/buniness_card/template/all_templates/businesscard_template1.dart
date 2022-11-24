import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../constants/images.dart';
import '../../../../constants/style.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;

class BusinessCardTemplate1 extends StatefulWidget {
  const BusinessCardTemplate1({Key? key}) : super(key: key);

  @override
  State<BusinessCardTemplate1> createState() => _BusinessCardTemplate1State();
}

class _BusinessCardTemplate1State extends State<BusinessCardTemplate1> {
  GlobalKey globalKey = GlobalKey();

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
            "Business Card Template 1",
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
                    Image.asset(businessCard1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: Column(
                            children: [
                              ClipOval(
                                child: Container(
                                  color: Colors.white,
                                  child: Image.asset(
                                    resumeBro,
                                    width: 70,
                                    height: 70,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Company Name',
                                style: GoogleFonts.kalam(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Tag Line should be only 1 line ',
                                style: GoogleFonts.oswald(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 3),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Your Name',
                                style: GoogleFonts.oswald(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 3),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.people_outline_sharp,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Post in the company',
                                style: GoogleFonts.oswald(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 3),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'youremailhere@gmail.com',
                                style: GoogleFonts.oswald(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 3),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.sports_basketball,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'yourwebsitehere.com',
                                style: GoogleFonts.oswald(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 3),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.house,
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Youraddressoverhere max 120 keys',
                                style: GoogleFonts.oswald(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, bottom: 3, top: 55),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.phone,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '03001234567',
                                        style: GoogleFonts.oswald(
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 10,
                                    bottom: 3,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.phone,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '03001234567',
                                        style: GoogleFonts.oswald(
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
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
