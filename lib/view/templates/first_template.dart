// import 'dart:io';
// import 'dart:math';
// import 'package:flutter/material.dart' as m;
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart';
// import '../../constants/images.dart';
// import '../../constants/style.dart';
//
// class PdfFirstTemplateApi {
//   static Future<Future<File>> generate() async {
//     final pdf = Document();
//     // final image = MemoryImage(File('assets/images/Resume-bro.png').readAsBytesSync());
//     pdf.addPage(
//       MultiPage(
//         build: (context) => [
//           ///top
//           Container(
//             padding: EdgeInsets.all(5),
//             decoration: BoxDecoration(
//               color: PdfColors.blue50,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 // Image(image, width: 60, height: 60, fit: BoxFit.cover),
//                 SizedBox(),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Header(
//                       text: 'Muhammad Abdul Quddus',
//                       textStyle: TextStyle(
//                         color: PdfColors.blue,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       'abdulquddus7782@gmail.com',
//                       style: TextStyle(
//                         color: PdfColors.grey.shade(700),
//                         fontSize: 10,
//                       ),
//                     ),
//                     Text(
//                       '03001234567',
//                       style: TextStyle(
//                         color: PdfColors.grey.shade(700),
//                         fontSize: 10,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ///left side
//               Container(
//                 padding: EdgeInsets.all(10),
//                 width: 150,
//                 color: PdfColors.grey50,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Header(
//                       text: "Personal Information",
//                       textStyle: TextStyle(
//                         color: PdfColors.blue,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       "Address:",
//                       style: TextStyle(
//                         color: PdfColors.blueGrey300,
//                         fontSize: 10,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       '${LoremText().paragraph(20)}',
//                       style: TextStyle(
//                         fontSize: 8,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                       Text(
//                         "Date of Birth:",
//                         style: TextStyle(
//                           color: PdfColors.blueGrey300,
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         '25-10-2000',
//                         style: TextStyle(
//                           fontSize: 8,
//                         ),
//                       ),
//                     ]),
//                     SizedBox(height: 5),
//                     Row(children: [
//                       Text(
//                         "Website:",
//                         style: TextStyle(
//                           color: PdfColors.blueGrey300,
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       UrlLink(
//                           child: Text(
//                             'Personal Website',
//                             style: TextStyle(
//                               fontSize: 8,
//                               color: PdfColors.blue,
//                             ),
//                           ),
//                           destination: "https://github.com/Iamabdulquddus"),
//                     ]),
//                     Header(
//                       text: "Objective",
//                       textStyle: TextStyle(
//                         color: PdfColors.blue,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       '${LoremText().paragraph(20)}',
//                       style: TextStyle(
//                         fontSize: 8,
//                       ),
//                     ),
//                     Header(
//                       text: "Interests",
//                       textStyle: TextStyle(
//                         color: PdfColors.blue,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Bullet(
//                       text: 'First Interest',
//                       style: TextStyle(
//                         fontSize: 9,
//                       ),
//                     ),
//                     Bullet(
//                       text: 'Second Interest',
//                       style: TextStyle(
//                         fontSize: 9,
//                       ),
//                     ),
//                     Header(
//                       text: "Activities",
//                       textStyle: TextStyle(
//                         color: PdfColors.blue,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Bullet(
//                       text: 'First Activity',
//                       style: TextStyle(
//                         fontSize: 9,
//                       ),
//                     ),
//                     Bullet(
//                       text: 'Second Activity',
//                       style: TextStyle(
//                         fontSize: 9,
//                       ),
//                     ),
//                     Header(
//                       text: "Languages",
//                       textStyle: TextStyle(
//                         color: PdfColors.blue,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Bullet(
//                       text: 'First Language',
//                       style: TextStyle(
//                         fontSize: 9,
//                       ),
//                     ),
//                     Bullet(
//                       text: 'Second Language',
//                       style: TextStyle(
//                         fontSize: 9,
//                       ),
//                     ),
//                     Bullet(
//                       text: 'Third Language',
//                       style: TextStyle(
//                         fontSize: 9,
//                       ),
//                     ),
//                     Header(
//                       text: "Achievements & Rewards",
//                       textStyle: TextStyle(
//                         color: PdfColors.blue,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Bullet(
//                       text: 'First Achievement',
//                       style: TextStyle(
//                         fontSize: 9,
//                       ),
//                     ),
//                     Bullet(
//                       text: 'Second Achievement',
//                       style: TextStyle(
//                         fontSize: 9,
//                       ),
//                     ),
//                     Bullet(
//                       text: 'Third Achievement',
//                       style: TextStyle(
//                         fontSize: 9,
//                       ),
//                     ),
//                     Header(
//                       text: "Skills",
//                       textStyle: TextStyle(
//                         color: PdfColors.blue,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Bullet(
//                       text: 'First Skill',
//                       style: TextStyle(
//                         fontSize: 9,
//                       ),
//                     ),
//                     Bullet(
//                       text: 'Second Skill',
//                       style: TextStyle(
//                         fontSize: 9,
//                       ),
//                     ),
//                     Bullet(
//                       text: 'Third Skill',
//                       style: TextStyle(
//                         fontSize: 9,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               ///Right side
//               Container(
//                 width: 332,
//                 color: PdfColors.red50,
//                 padding: EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Header(
//                       text: "Education",
//                       textStyle: TextStyle(
//                         color: PdfColors.blue,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 100,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '2014 - 2016',
//                                 style: TextStyle(
//                                   fontSize: 8,
//                                   color: PdfColors.grey800,
//                                 ),
//                               ),
//                               Text(
//                                 'Matriculation',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blue800,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 232,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Government High School Farooka Sargodha',
//                                 style: TextStyle(
//                                   fontSize: 9,
//                                   color: PdfColors.blue800,
//                                 ),
//                               ),
//                               Text(
//                                 '-- 847',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.grey800,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 100,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '2014 - 2016',
//                                 style: TextStyle(
//                                   fontSize: 8,
//                                   color: PdfColors.grey800,
//                                 ),
//                               ),
//                               Text(
//                                 'Matriculation',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blue800,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 232,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Government High School Farooka Sargodha',
//                                 style: TextStyle(
//                                   fontSize: 9,
//                                   color: PdfColors.blue800,
//                                 ),
//                               ),
//                               Text(
//                                 '-- 847',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.grey800,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 100,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '2014 - 2016',
//                                 style: TextStyle(
//                                   fontSize: 8,
//                                   color: PdfColors.grey800,
//                                 ),
//                               ),
//                               Text(
//                                 'Matriculation',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blue800,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 232,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Government High School Farooka Sargodha',
//                                 style: TextStyle(
//                                   fontSize: 9,
//                                   color: PdfColors.blue800,
//                                 ),
//                               ),
//                               Text(
//                                 '-- 847',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.grey800,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 100,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '2014 - 2016',
//                                 style: TextStyle(
//                                   fontSize: 8,
//                                   color: PdfColors.grey800,
//                                 ),
//                               ),
//                               Text(
//                                 'Matriculation',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blue800,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 232,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Government High School Farooka Sargodha',
//                                 style: TextStyle(
//                                   fontSize: 9,
//                                   color: PdfColors.blue800,
//                                 ),
//                               ),
//                               Text(
//                                 '-- 847',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.grey800,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Header(
//                       text: "Experience",
//                       textStyle: TextStyle(
//                         color: PdfColors.blue,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 132,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '2014 - 2016',
//                                 style: TextStyle(
//                                   fontSize: 8,
//                                   color: PdfColors.grey800,
//                                 ),
//                               ),
//                               Text(
//                                 'Basically Peasant',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blue500,
//                                 ),
//                               ),
//                               Text(
//                                 'Weird Company Limited',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blueGrey900,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: Text(
//                             'Being a peasant has to do all of the stuff in the company and the pay was in stones. So had to leave the company.',
//                             style: TextStyle(
//                               fontSize: 9,
//                               color: PdfColors.blue800,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 132,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '2014 - 2016',
//                                 style: TextStyle(
//                                   fontSize: 8,
//                                   color: PdfColors.grey800,
//                                 ),
//                               ),
//                               Text(
//                                 'Basically Peasant',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blue500,
//                                 ),
//                               ),
//                               Text(
//                                 'Weird Company Limited',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blueGrey900,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: Text(
//                             'Being a peasant has to do all of the stuff in the company and the pay was in stones. So had to leave the company.',
//                             style: TextStyle(
//                               fontSize: 9,
//                               color: PdfColors.blue800,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 132,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '2014 - 2016',
//                                 style: TextStyle(
//                                   fontSize: 8,
//                                   color: PdfColors.grey800,
//                                 ),
//                               ),
//                               Text(
//                                 'Basically Peasant',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blue500,
//                                 ),
//                               ),
//                               Text(
//                                 'Weird Company Limited',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blueGrey900,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: Text(
//                             'Being a peasant has to do all of the stuff in the company and the pay was in stones. So had to leave the company.',
//                             style: TextStyle(
//                               fontSize: 9,
//                               color: PdfColors.blue800,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 8),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 132,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '2014 - 2016',
//                                 style: TextStyle(
//                                   fontSize: 8,
//                                   color: PdfColors.grey800,
//                                 ),
//                               ),
//                               Text(
//                                 'Basically Peasant',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blue500,
//                                 ),
//                               ),
//                               Text(
//                                 'Weird Company Limited',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blueGrey900,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: Text(
//                             'Being a peasant has to do all of the stuff in the company and the pay was in stones. So had to leave the company.',
//                             style: TextStyle(
//                               fontSize: 9,
//                               color: PdfColors.blue800,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Header(
//                       text: "Reference",
//                       textStyle: TextStyle(
//                         color: PdfColors.blue,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 132,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Referance Name',
//                                 style: TextStyle(
//                                   fontSize: 8,
//                                   color: PdfColors.grey800,
//                                 ),
//                               ),
//                               Text(
//                                 'Phone No',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.grey500,
//                                 ),
//                               ),
//                               Text(
//                                 '03001234567',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blueGrey500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Job Title',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blue500,
//                                 ),
//                               ),
//                               Text(
//                                 'Weird Company Limited',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blueGrey900,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 132,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Referance Name',
//                                 style: TextStyle(
//                                   fontSize: 8,
//                                   color: PdfColors.grey800,
//                                 ),
//                               ),
//                               Text(
//                                 'Phone No',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.grey500,
//                                 ),
//                               ),
//                               Text(
//                                 '03001234567',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blueGrey500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Job Title',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blue500,
//                                 ),
//                               ),
//                               Text(
//                                 'Weird Company Limited',
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: PdfColors.blueGrey900,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Header(
//                       text: "Projects",
//                       textStyle: TextStyle(
//                         color: PdfColors.blue,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 132,
//                           child: Text(
//                             'Weird Company Limited',
//                             style: TextStyle(
//                               fontSize: 10,
//                               color: PdfColors.blueGrey900,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 190,
//                           child: Text(
//                             'Being a peasant has to do all of the stuff in the company and the pay was in stones. So had to leave the company.',
//                             style: TextStyle(
//                               fontSize: 8,
//                               color: PdfColors.blue800,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 132,
//                           child: Text(
//                             'Weird Company Limited',
//                             style: TextStyle(
//                               fontSize: 10,
//                               color: PdfColors.blueGrey900,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 190,
//                           child: Text(
//                             'Being a peasant has to do all of the stuff in the company and the pay was in stones. So had to leave the company.',
//                             style: TextStyle(
//                               fontSize: 8,
//                               color: PdfColors.blue800,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Header(
//                       text: "Publications",
//                       textStyle: TextStyle(
//                         color: PdfColors.blue,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 132,
//                           child: Text(
//                             'Weird Company Limited',
//                             style: TextStyle(
//                               fontSize: 10,
//                               color: PdfColors.blueGrey900,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: Text(
//                             'Being a peasant has to do all of the stuff in the.',
//                             style: TextStyle(
//                               fontSize: 8,
//                               color: PdfColors.blue800,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 132,
//                           child: Text(
//                             'Weird Company Limited',
//                             style: TextStyle(
//                               fontSize: 10,
//                               color: PdfColors.blueGrey900,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 200,
//                           child: Text(
//                             'Being a peasant has to do all of the stuff in the.',
//                             style: TextStyle(
//                               fontSize: 8,
//                               color: PdfColors.blue800,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//     return saveDocument(name: "my_example.pdf", pdf: pdf);
//   }
//
//   static Future<File> saveDocument({
//     required String name,
//     required Document pdf,
//   }) async {
//     final bytes = await pdf.save();
//
//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/$name');
//
//     await file.writeAsBytes(bytes);
//
//     return file;
//   }
//
//   static Future openFile(File file) async {
//     final url = file.path;
//     await OpenFile.open(url);
//   }
// }
