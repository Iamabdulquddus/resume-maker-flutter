import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:resumemaker/constants/images.dart';
import '../preview/components/data.dart';

const PdfColor green = PdfColor.fromInt(0xff9ce5d9);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;

Future<Uint8List> generateResume(PdfPageFormat format, CustomData data) async {
  final doc = Document(title: 'My Resume', author: 'Resume Maker');

  final profileImage = MemoryImage(
    (await rootBundle.load(resumeBro)).buffer.asUint8List(),
  );

  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    MultiPage(
      pageTheme: pageTheme,
      build: (Context context) => [
        Partitions(
          children: [
            Partition(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 30, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Muhammad Abdul Quddus',
                            textScaleFactor: 2,
                            style: Theme.of(context)
                                .defaultTextStyle
                                .copyWith(fontWeight: FontWeight.bold)),
                        Padding(padding: const EdgeInsets.only(top: 20)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: 150,
                              child: Text(
                                  'This is very long address of like 4 lines. so Im just typing text here.'),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('+1 403-721-6898'),
                                Text('Date of birth here'),
                                UrlText('abdulquddus7782@gmail.com',
                                    'mailto:abdulquddus7782@gmail.com'),
                                UrlText('My website', 'https://github.com/Iamabdulquddus'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Category(title: 'Objective'),
                  Text('${Lorem(length: 20)}'),
                  Category(title: 'Work Experience'),
                  Block(title: 'Tour bus driver', icon: const IconData(0xe530)),
                  Block(
                      title: 'Logging equipment operator',
                      icon: const IconData(0xe30d)),
                  Block(title: 'Foot doctor', icon: const IconData(0xe3f3)),
                  Block(title: 'Unicorn trainer', icon: const IconData(0xf0cf)),
                  Block(title: 'Chief chatter', icon: const IconData(0xe0ca)),
                  SizedBox(height: 20),
                  Category(title: 'Education'),
                  Block(title: 'Bachelor Of Commerce'),
                  Block(title: 'Bachelor Interior Design'),
                  SizedBox(height: 20),
                  Category(title: 'Publications'),
                  Category(title: 'Reference'),
                ],
              ),
            ),
            Partition(
              width: sep,
              child: Column(
                children: [
                  Container(
                    height: pageTheme.pageFormat.availableHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ClipOval(
                          child: Container(
                            width: 100,
                            height: 100,
                            color: lightGreen,
                            child: Image(profileImage),
                          ),
                        ),
                        Column(children: <Widget>[
                          Category(title: 'Skills'),
                          Category(title: 'Interests'),
                          Category(title: 'Activities'),
                          Category(title: 'Languages'),

                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
  return doc.save();
}

Future<PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString('assets/resume.svg');

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 4.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return PageTheme(
    pageFormat: format,
    theme: ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (Context context) {
      return FullPage(
        ignoreMargins: true,
        child: Stack(
          children: [
            Positioned(
              child: SvgImage(svg: bgShape),
              left: 0,
              top: 0,
            ),
            Positioned(
              child: Transform.rotate(angle: pi, child: SvgImage(svg: bgShape)),
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      );
    },
  );
}

class Block extends StatelessWidget {
  Block({required this.title, this.icon,});

  final String title;
  final IconData? icon;

  @override
  Widget build(Context context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 6,
              height: 6,
              margin: const EdgeInsets.only(top: 5.5, left: 2, right: 5),
              decoration: const BoxDecoration(
                color: green,
                shape: BoxShape.circle,
              ),
            ),
            Text(
              title,
              style: Theme.of(context)
                  .defaultTextStyle
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Row(
              children: [
                Text('2014 - 2016'),
              ],
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: green, width: 2),
            ),
          ),
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          margin: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Lorem(length: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class Category extends StatelessWidget {
  Category({required this.title});

  final String title;

  @override
  Widget build(Context context) {
    return Container(
      decoration: const BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      margin: const EdgeInsets.only(bottom: 10, top: 20),
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: Text(
        title,
        textScaleFactor: 1.5,
      ),
    );
  }
}

// class Percent extends StatelessWidget {
//   Percent({
//     required this.size,
//     required this.value,
//     required this.title,
//   });
//
//   final double size;
//
//   final double value;
//
//   final Widget title;
//
//   static const fontSize = 1.2;
//
//   PdfColor get color => green;
//
//   static const backgroundColor = PdfColors.grey300;
//
//   static const strokeWidth = 5.0;
//
//   @override
//   Widget build(Context context) {
//     final widgets = <Widget>[
//       Container(
//         width: size,
//         height: size,
//         child: Stack(
//           alignment: Alignment.center,
//           fit: StackFit.expand,
//           children: <Widget>[
//             Center(
//               child: Text(
//                 '${(value * 100).round().toInt()}%',
//                 textScaleFactor: fontSize,
//               ),
//             ),
//             CircularProgressIndicator(
//               value: value,
//               backgroundColor: backgroundColor,
//               color: color,
//               strokeWidth: strokeWidth,
//             ),
//           ],
//         ),
//       )
//     ];
//
//     widgets.add(title);
//
//     return Column(children: widgets);
//   }
// }

class UrlText extends StatelessWidget {
  UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  Widget build(Context context) {
    return UrlLink(
      destination: url,
      child: Text(text,
          style: const TextStyle(
            decoration: TextDecoration.underline,
            color: PdfColors.blue,
          )),
    );
  }
}
