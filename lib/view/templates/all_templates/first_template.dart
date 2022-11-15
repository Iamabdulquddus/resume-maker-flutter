
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import '../../../constants/images.dart';
import '../../preview/components/data.dart';


   Future<Uint8List> template1(PdfPageFormat format, CustomData data) async {
     final doc = Document(title: 'My Resume', author: 'Resume Maker');

    final profileImage = MemoryImage(
      (await rootBundle.load(resumeBro)).buffer.asUint8List(),
    );
    doc.addPage(
      MultiPage(
        build: (context) => [
          ///top
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: PdfColors.blue50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image(profileImage),
                  ),
                ),
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
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '03001234567',
                      style: TextStyle(
                        color: PdfColors.grey.shade(700),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Partitions(

            children: [
              ///left side
              Partition(
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(
                    text: "Personal Information",
                    textStyle: TextStyle(
                      color: PdfColors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Address:",
                    style: TextStyle(
                      color: PdfColors.blueGrey300,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${LoremText().paragraph(20)}',
                    style: const TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date of Birth:",
                          style: TextStyle(
                            color: PdfColors.blueGrey300,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '25-10-2000',
                          style: const TextStyle(
                            fontSize: 8,
                          ),
                        ),
                      ]),
                  SizedBox(height: 5),
                  Row(children: [
                    Text(
                      "Website:",
                      style: TextStyle(
                        color: PdfColors.blueGrey300,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    UrlLink(
                        child: Text(
                          'Personal Website',
                          style: const TextStyle(
                            fontSize: 8,
                            color: PdfColors.blue,
                          ),
                        ),
                        destination: "https://github.com/Iamabdulquddus"),
                  ]),
                  Header(
                    text: "Objective",
                    textStyle: TextStyle(
                      color: PdfColors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${LoremText().paragraph(20)}',
                    style: const TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  Header(
                    text: "Interests",
                    textStyle: TextStyle(
                      color: PdfColors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Bullet(
                    text: 'First Interest',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  Bullet(
                    text: 'Second Interest',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  Header(
                    text: "Activities",
                    textStyle: TextStyle(
                      color: PdfColors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Bullet(
                    text: 'First Activity',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  Bullet(
                    text: 'Second Activity',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  Header(
                    text: "Languages",
                    textStyle: TextStyle(
                      color: PdfColors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Bullet(
                    text: 'First Language',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  Bullet(
                    text: 'Second Language',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  Bullet(
                    text: 'Third Language',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  Header(
                    text: "Achievements & Rewards",
                    textStyle: TextStyle(
                      color: PdfColors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Bullet(
                    text: 'First Achievement',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  Bullet(
                    text: 'Second Achievement',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  Bullet(
                    text: 'Third Achievement',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  Header(
                    text: "Skills",
                    textStyle: TextStyle(
                      color: PdfColors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Bullet(
                    text: 'First Skill',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  Bullet(
                    text: 'Second Skill',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  Bullet(
                    text: 'Third Skill',
                    style: const TextStyle(
                      fontSize: 9,
                    ),
                  ),
                ]
              ),),
              ///Right side
              Partition(
                child: Container  (
                  padding: EdgeInsets.only(left: 10),
                  color: PdfColor.fromInt(0xffcdf1e7),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(
                    text: "Education",
                    textStyle: TextStyle(
                      color: PdfColors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2014 - 2016',
                              style: const TextStyle(
                                fontSize: 8,
                                color: PdfColors.grey800,
                              ),
                            ),
                            Text(
                              'Matriculation',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blue800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 232,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Government High School Farooka Sargodha',
                              style: const TextStyle(
                                fontSize: 9,
                                color: PdfColors.blue800,
                              ),
                            ),
                            Text(
                              '-- 847',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.grey800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2014 - 2016',
                              style: const TextStyle(
                                fontSize: 8,
                                color: PdfColors.grey800,
                              ),
                            ),
                            Text(
                              'Matriculation',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blue800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 232,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Government High School Farooka Sargodha',
                              style: const TextStyle(
                                fontSize: 9,
                                color: PdfColors.blue800,
                              ),
                            ),
                            Text(
                              '-- 847',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.grey800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2014 - 2016',
                              style: const TextStyle(
                                fontSize: 8,
                                color: PdfColors.grey800,
                              ),
                            ),
                            Text(
                              'Matriculation',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blue800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 232,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Government High School Farooka Sargodha',
                              style: const TextStyle(
                                fontSize: 9,
                                color: PdfColors.blue800,
                              ),
                            ),
                            Text(
                              '-- 847',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.grey800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2014 - 2016',
                              style: const TextStyle(
                                fontSize: 8,
                                color: PdfColors.grey800,
                              ),
                            ),
                            Text(
                              'Matriculation',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blue800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 232,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Government High School Farooka Sargodha',
                              style: const TextStyle(
                                fontSize: 9,
                                color: PdfColors.blue800,
                              ),
                            ),
                            Text(
                              '-- 847',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.grey800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Header(
                    text: "Experience",
                    textStyle: TextStyle(
                      color: PdfColors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 132,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2014 - 2016',
                              style: const TextStyle(
                                fontSize: 8,
                                color: PdfColors.grey800,
                              ),
                            ),
                            Text(
                              'Basically Peasant',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blue500,
                              ),
                            ),
                            Text(
                              'Weird Company Limited',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blueGrey900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Being a peasant has to do all of the stuff in the company and the pay was in stones. So had to leave the company.',
                          style: const TextStyle(
                            fontSize: 9,
                            color: PdfColors.blue800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 132,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2014 - 2016',
                              style: const TextStyle(
                                fontSize: 8,
                                color: PdfColors.grey800,
                              ),
                            ),
                            Text(
                              'Basically Peasant',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blue500,
                              ),
                            ),
                            Text(
                              'Weird Company Limited',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blueGrey900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Being a peasant has to do all of the stuff in the company and the pay was in stones. So had to leave the company.',
                          style: const TextStyle(
                            fontSize: 9,
                            color: PdfColors.blue800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 132,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2014 - 2016',
                              style: const TextStyle(
                                fontSize: 8,
                                color: PdfColors.grey800,
                              ),
                            ),
                            Text(
                              'Basically Peasant',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blue500,
                              ),
                            ),
                            Text(
                              'Weird Company Limited',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blueGrey900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Being a peasant has to do all of the stuff in the company and the pay was in stones. So had to leave the company.',
                          style: const TextStyle(
                            fontSize: 9,
                            color: PdfColors.blue800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 132,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2014 - 2016',
                              style: const TextStyle(
                                fontSize: 8,
                                color: PdfColors.grey800,
                              ),
                            ),
                            Text(
                              'Basically Peasant',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blue500,
                              ),
                            ),
                            Text(
                              'Weird Company Limited',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blueGrey900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Being a peasant has to do all of the stuff in the company and the pay was in stones. So had to leave the company.',
                          style: const TextStyle(
                            fontSize: 9,
                            color: PdfColors.blue800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Header(
                    text: "Reference",
                    textStyle: TextStyle(
                      color: PdfColors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 132,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Referance Name',
                              style: const TextStyle(
                                fontSize: 8,
                                color: PdfColors.grey800,
                              ),
                            ),
                            Text(
                              'Phone No',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.grey500,
                              ),
                            ),
                            Text(
                              '03001234567',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blueGrey500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Job Title',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blue500,
                              ),
                            ),
                            Text(
                              'Weird Company Limited',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blueGrey900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 132,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Referance Name',
                              style: const TextStyle(
                                fontSize: 8,
                                color: PdfColors.grey800,
                              ),
                            ),
                            Text(
                              'Phone No',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.grey500,
                              ),
                            ),
                            Text(
                              '03001234567',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blueGrey500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Job Title',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blue500,
                              ),
                            ),
                            Text(
                              'Weird Company Limited',
                              style: const TextStyle(
                                fontSize: 10,
                                color: PdfColors.blueGrey900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Header(
                    text: "Projects",
                    textStyle: TextStyle(
                      color: PdfColors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 132,
                        child: Text(
                          'Weird Company Limited',
                          style: const TextStyle(
                            fontSize: 10,
                            color: PdfColors.blueGrey900,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 190,
                        child: Text(
                          'Being a peasant has to do all of the stuff in the company and the pay was in stones. So had to leave the company.',
                          style: const TextStyle(
                            fontSize: 8,
                            color: PdfColors.blue800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 132,
                        child: Text(
                          'Weird Company Limited',
                          style: const TextStyle(
                            fontSize: 10,
                            color: PdfColors.blueGrey900,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 190,
                        child: Text(
                          'Being a peasant has to do all of the stuff in the company and the pay was in stones. So had to leave the company.',
                          style: const TextStyle(
                            fontSize: 8,
                            color: PdfColors.blue800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Header(
                    text: "Publications",
                    textStyle: TextStyle(
                      color: PdfColors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 132,
                        child: Text(
                          'Weird Company Limited',
                          style: const TextStyle(
                            fontSize: 10,
                            color: PdfColors.blueGrey900,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Being a peasant has to do all of the stuff in the.',
                          style: const TextStyle(
                            fontSize: 8,
                            color: PdfColors.blue800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 132,
                        child: Text(
                          'Weird Company Limited',
                          style: const TextStyle(
                            fontSize: 10,
                            color: PdfColors.blueGrey900,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Being a peasant has to do all of the stuff in the.',
                          style: const TextStyle(
                            fontSize: 8,
                            color: PdfColors.blue800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),)),


            ],
          ),
        ],
      ),
    );
     return doc.save();
  }



