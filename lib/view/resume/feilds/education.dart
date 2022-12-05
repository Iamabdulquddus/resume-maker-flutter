import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../widgets/textformfeild.dart';
import 'package:resumemaker/controller/resume_controller.dart';
import 'package:get/get.dart';

class Education extends StatefulWidget {

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  ResumeController resumeController = Get.find();

  int numberOfTextFields = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: wWhiteColor,
          ),
        ),
        title: Text(
          "Education",
          style: MyTextStyles.headingxSmallBoldWhite,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      resumeController.addEducations();
                    },
                    child: Text('Save'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      onPressed: () {
                        // setState(() {
                        //   numberOfTextFields++;
                        // });
                        resumeController.valueEducationController.value++;
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: primary.withOpacity(0.1)),
                      child: const Text('Add another'),
                    ),
                  ),
                ],
              ),
              Form(
                child:  SizedBox(
                  height: 631.5,
                  child: Obx(
                        ()=> ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: resumeController.valueEducationController.value,
                            itemBuilder: (context,index){
                              resumeController.listJoinFromYearController.add(TextEditingController());
                              resumeController.listJoinToYearController.add(TextEditingController());
                              resumeController.listDegreeOrCourseController.add(TextEditingController());
                              resumeController.listUniOrSchoolController.add(TextEditingController());
                              resumeController.listGPAOrMarksController.add(TextEditingController());
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: lightColor),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: primary.withOpacity(0.2),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Education",
                                              style: MyTextStyles.headingLargePrimary,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                // setState(() {
                                                //   numberOfTextFields--;
                                                // });
                                                resumeController.valueEducationController.value--;
                                              },
                                              icon: const Icon(
                                                Icons.delete,
                                                color: primary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 5),
                                        child: Column(
                                          children: [
                                            CustomTextFormFeild(
                                              controller: resumeController.listDegreeOrCourseController[index],
                                              maxLines: 1,
                                              labelText: 'Degree / Course',
                                              keyboardType: TextInputType.text,
                                            ),
                                            CustomTextFormFeild(
                                              controller: resumeController.listUniOrSchoolController[index],
                                              maxLines: 1,
                                              labelText: 'School / Universiy',
                                              keyboardType: TextInputType.text,
                                            ),
                                            CustomTextFormFeild(
                                              controller: resumeController.listGPAOrMarksController[index],
                                              maxLines: 1,
                                              labelText: 'Marks / CGPA',
                                              keyboardType: TextInputType.text,
                                            ),
                                            CustomTextFormFeild(
                                              controller: resumeController.listJoinFromYearController[index],
                                              maxLines: 1,
                                              labelText: 'From (year)',
                                              keyboardType: TextInputType.text,
                                              maxLenght: 4,
                                            ),
                                            CustomTextFormFeild(
                                              controller: resumeController.listJoinToYearController[index],
                                              maxLines: 1,
                                              labelText: 'To (year)',
                                              keyboardType: TextInputType.text,
                                              maxLenght: 4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                    ),
                  ),
                ),
                // child: Column(
                //   children: [
                //     // for (int i = 0; i < numberOfTextFields; i++)
                //     //   Padding(
                //     //     padding: const EdgeInsets.symmetric(vertical: 10),
                //     //     child: Container(
                //     //       decoration: BoxDecoration(
                //     //           borderRadius: BorderRadius.circular(10),
                //     //           color: lightColor),
                //     //       child: Column(
                //     //         children: [
                //     //           Container(
                //     //             padding: const EdgeInsets.symmetric(
                //     //                 horizontal: 10, vertical: 3),
                //     //             decoration: BoxDecoration(
                //     //               color: primary.withOpacity(0.2),
                //     //               borderRadius: BorderRadius.only(
                //     //                 topLeft: Radius.circular(10),
                //     //                 topRight: Radius.circular(10),
                //     //               ),
                //     //             ),
                //     //             child: Row(
                //     //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     //               children: [
                //     //                 Text(
                //     //                   "Education",
                //     //                   style: MyTextStyles.headingLargePrimary,
                //     //                 ),
                //     //                 IconButton(
                //     //                   onPressed: () {
                //     //                     setState(() {
                //     //                       numberOfTextFields--;
                //     //                     });
                //     //                   },
                //     //                   icon: const Icon(
                //     //                     Icons.delete,
                //     //                     color: primary,
                //     //                   ),
                //     //                 ),
                //     //               ],
                //     //             ),
                //     //           ),
                //     //           Padding(
                //     //             padding: EdgeInsets.symmetric(
                //     //                 vertical: 10, horizontal: 5),
                //     //             child: Column(
                //     //               children: const [
                //     //                 CustomTextFormFeild(
                //     //                   maxLines: 1,
                //     //                   labelText: 'Degree / Course',
                //     //                   keyboardType: TextInputType.text,
                //     //                 ),
                //     //                 CustomTextFormFeild(
                //     //                   maxLines: 1,
                //     //                   labelText: 'School / Universiy',
                //     //                   keyboardType: TextInputType.text,
                //     //                 ),
                //     //                 CustomTextFormFeild(
                //     //                   maxLines: 1,
                //     //                   labelText: 'Marks / CGPA',
                //     //                   keyboardType: TextInputType.text,
                //     //                 ),
                //     //                 CustomTextFormFeild(
                //     //                   maxLines: 1,
                //     //                   labelText: 'From (year)',
                //     //                   keyboardType: TextInputType.text,
                //     //                   maxLenght: 4,
                //     //                 ),
                //     //                 CustomTextFormFeild(
                //     //                   maxLines: 1,
                //     //                   labelText: 'To (year)',
                //     //                   keyboardType: TextInputType.text,
                //     //                   maxLenght: 4,
                //     //                 ),
                //     //               ],
                //     //             ),
                //     //           ),
                //     //         ],
                //     //       ),
                //     //     ),
                //     //   ),
                //     //
                //     Obx(
                //       ()=> ListView.builder(
                //           itemCount: resumeController.valueEducationController.value,
                //           itemBuilder: (context,index){
                //             return Padding(
                //               padding: const EdgeInsets.symmetric(vertical: 10),
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(10),
                //                     color: lightColor),
                //                 child: Column(
                //                   children: [
                //                     Container(
                //                       padding: const EdgeInsets.symmetric(
                //                           horizontal: 10, vertical: 3),
                //                       decoration: BoxDecoration(
                //                         color: primary.withOpacity(0.2),
                //                         borderRadius: BorderRadius.only(
                //                           topLeft: Radius.circular(10),
                //                           topRight: Radius.circular(10),
                //                         ),
                //                       ),
                //                       child: Row(
                //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Text(
                //                             "Education",
                //                             style: MyTextStyles.headingLargePrimary,
                //                           ),
                //                           IconButton(
                //                             onPressed: () {
                //                               // setState(() {
                //                               //   numberOfTextFields--;
                //                               // });
                //                               resumeController.valueEducationController.value--;
                //                             },
                //                             icon: const Icon(
                //                               Icons.delete,
                //                               color: primary,
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                     Padding(
                //                       padding: EdgeInsets.symmetric(
                //                           vertical: 10, horizontal: 5),
                //                       child: Column(
                //                         children: const [
                //                           CustomTextFormFeild(
                //                             maxLines: 1,
                //                             labelText: 'Degree / Course',
                //                             keyboardType: TextInputType.text,
                //                           ),
                //                           CustomTextFormFeild(
                //                             maxLines: 1,
                //                             labelText: 'School / Universiy',
                //                             keyboardType: TextInputType.text,
                //                           ),
                //                           CustomTextFormFeild(
                //                             maxLines: 1,
                //                             labelText: 'Marks / CGPA',
                //                             keyboardType: TextInputType.text,
                //                           ),
                //                           CustomTextFormFeild(
                //                             maxLines: 1,
                //                             labelText: 'From (year)',
                //                             keyboardType: TextInputType.text,
                //                             maxLenght: 4,
                //                           ),
                //                           CustomTextFormFeild(
                //                             maxLines: 1,
                //                             labelText: 'To (year)',
                //                             keyboardType: TextInputType.text,
                //                             maxLenght: 4,
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             );
                //           }
                //       ),
                //     ),
                //
                //   ],
                // ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
