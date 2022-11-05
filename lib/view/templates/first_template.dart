import 'dart:io';
import 'package:flutter/material.dart' as md;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../constants/images.dart';
import '../../constants/style.dart';

class PdfFirstTemplateApi {
  static Future<Future<File>> generate() async {
    final pdf = Document();
    final image = MemoryImage(File('assets/images/Resume-bro.png').readAsBytesSync());
    pdf.addPage(
      MultiPage(
          build: (context) => [
                ///top
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: PdfColors.blue50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image, width: 100, height: 100, fit: BoxFit.cover),
                      SizedBox(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Header(
                            text: 'Muhammad Abdul Quddus',
                            textStyle: TextStyle(
                              color: PdfColors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'abdulquddus7782@gmail.com',
                            style: TextStyle(
                              color: PdfColors.grey.shade(700),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(children: [
                  ///left side
                  Column(children: []),

                  ///Right side
                  Column(children: [])
                ]),
              ]),
    );
    return saveDocument(name: "my_example.pdf", pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
