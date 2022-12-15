import 'package:flutter/material.dart';
import 'package:resumemaker/constants/sqflite_constants.dart';

import '../../../constants/style.dart';
import '../../../controller/resume_controller.dart';
import '../../../widgets/textformfeild.dart';
import 'package:get/get.dart';

class SkillsInterestActivities extends StatefulWidget {
  const SkillsInterestActivities({Key? key})
      : super(key: key);
  @override
  State<SkillsInterestActivities> createState() =>
      _SkillsInterestActivitiesState();
}

class _SkillsInterestActivitiesState extends State<SkillsInterestActivities> {
  ResumeController _resumeController = Get.find();
  String field = Get.arguments[SQ_USER_COMMON_ACTIVITY_TYPE];

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
          field,
          style: MyTextStyles.headingxSmallBoldWhite,
        ),
      ),
      body: SingleChildScrollView(
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
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount:  field=="Skills" ? _resumeController.valueSkillController.value :
                          field=="Interests" ? _resumeController.valueInterestController.value :
                          field=="Languages" ? _resumeController.valueLanguageController.value :
                          field=="Achievements & Awards" ? _resumeController.valueAwardController.value :
                          _resumeController.valueActivityController.value  ,
                          itemBuilder: (context,index){
                            field=="Skills" ? _resumeController.listSkillController.add(TextEditingController()) :
                            field=="Interests" ? _resumeController.listInterestController.add(TextEditingController()) :
                            field=="Languages" ? _resumeController.listLanguageController.add(TextEditingController()) :
                            field=="Achievements & Awards" ? _resumeController.listAwardController.add(TextEditingController()) :
                            _resumeController.listActivityController.add(TextEditingController());
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            field,
                                            style: MyTextStyles.headingLargePrimary,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              field=="Skills" ? _resumeController.valueSkillController-- :
                                              field=="Interests" ? _resumeController.valueInterestController-- :
                                              field=="Languages" ? _resumeController.valueLanguageController-- :
                                              field=="Achievements & Awards" ? _resumeController.valueAwardController-- :
                                              _resumeController.valueActivityController--;
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
                                            controller: field=="Skills" ? _resumeController.listSkillController[index] :
                                            field=="Interests" ? _resumeController.listInterestController[index] :
                                            field=="Languages" ? _resumeController.listLanguageController[index] :
                                            field=="Achievements & Awards" ? _resumeController.listAwardController[index] :
                                            _resumeController.listActivityController[index] ,
                                            maxLines: 1,
                                            labelText: "${field}",
                                            keyboardType: TextInputType.text,
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
                      onPressed:  (){
                        _resumeController.addCommon(field);
                      },
                      child: Text('Save'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextButton(
                        onPressed: () {
                          field=="Skills" ? _resumeController.valueSkillController++ :
                          field=="Interests" ? _resumeController.valueInterestController++ :
                          field=="Languages" ? _resumeController.valueLanguageController++ :
                          field=="Achievements & Awards" ? _resumeController.valueAwardController++ :
                          _resumeController.valueActivityController++;
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
