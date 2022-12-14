import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumemaker/controller/resume_controller.dart';

import '../../../constants/style.dart';
import '../../../widgets/textformfeild.dart';

class Reference extends StatefulWidget {
  const Reference({Key? key}) : super(key: key);

  @override
  State<Reference> createState() => _ReferenceState();
}

class _ReferenceState extends State<Reference> {
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
          "Reference",
          style: MyTextStyles.headingxSmallBoldWhite,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    Obx(
                      ()=> ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: ScrollPhysics(),
                          itemCount: resumeController.valueReferenceController.value,
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                            resumeController.referenceCompanyNameController.add(TextEditingController());
                            resumeController.referenceJobTileController.add(TextEditingController());
                            resumeController.referencePhoneNoController.add(TextEditingController());
                            resumeController.referenceNameController.add(TextEditingController());
                            resumeController.referenceEmailController.add(TextEditingController());
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
                                            "Reference",
                                            style: MyTextStyles.headingLargePrimary,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              resumeController.valueReferenceController.value--;
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
                                            controller: resumeController.referenceNameController[index],
                                            maxLines: 1,
                                            labelText: 'Reference Name',
                                            keyboardType: TextInputType.name,
                                          ),
                                          CustomTextFormFeild(
                                            controller: resumeController.referenceJobTileController[index],
                                            maxLines: 1,
                                            labelText: 'Job Title',
                                            keyboardType: TextInputType.text,
                                          ),
                                          CustomTextFormFeild(
                                            controller: resumeController.referenceCompanyNameController[index],
                                            maxLines: 1,
                                            labelText: 'Company Name',
                                            keyboardType: TextInputType.name,
                                          ),
                                          CustomTextFormFeild(
                                            controller: resumeController.referenceEmailController[index],
                                            maxLines: 1,
                                            labelText: 'Email',
                                            keyboardType: TextInputType.emailAddress,

                                          ),
                                          CustomTextFormFeild(
                                            controller: resumeController.referencePhoneNoController[index],
                                            maxLines: 1,
                                            labelText: 'Phone',
                                            keyboardType: TextInputType.phone,
                                            maxLenght: 11,
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
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Save'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextButton(
                        onPressed: () {
                            resumeController.valueReferenceController.value++;
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: primary.withOpacity(0.1)),
                        child: const Text('Add another'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
