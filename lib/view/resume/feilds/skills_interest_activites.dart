import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../controller/resume_controller.dart';
import '../../../widgets/textformfeild.dart';
import 'package:get/get.dart';

class SkillsInterestActivities extends StatefulWidget {
  const SkillsInterestActivities({Key? key, required this.field})
      : super(key: key);
  final String field;
  @override
  State<SkillsInterestActivities> createState() =>
      _SkillsInterestActivitiesState();
}

class _SkillsInterestActivitiesState extends State<SkillsInterestActivities> {
  ResumeController _resumeController = Get.find();

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
          "${widget.field}s",
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
                    SizedBox(
                      height: 700,
                      child: Obx(
                        ()=> ListView.builder(
                            shrinkWrap: true,
                            itemCount: _resumeController.valueSkillController.value,
                            itemBuilder: (context,index){
                              _resumeController.listSkillController.add(TextEditingController());
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
                                              widget.field,
                                              style: MyTextStyles.headingLargePrimary,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                _resumeController.valueSkillController.value--;
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
                                              controller: _resumeController.listSkillController[index],
                                              maxLines: 1,
                                              labelText: "${widget.field}",
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
                    ),

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed:  (){
                      _resumeController.addSkill();
                    },
                    child: Text('Save'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      onPressed: () {
                          _resumeController.valueSkillController.value++;
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: primary.withOpacity(0.1)),
                      child: const Text('Add another'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
