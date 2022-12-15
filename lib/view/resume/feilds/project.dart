import 'package:flutter/material.dart';
import 'package:resumemaker/controller/resume_controller.dart';
import 'package:get/get.dart';
import '../../../constants/style.dart';
import '../../../widgets/textformfeild.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  ResumeController _resumeController = Get.find();
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
          "Projects",
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
                    Obx(() => ListView.builder(
                      itemCount: _resumeController.valueProjectController.value,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context,index){
                        _resumeController.projectTitleController.add(TextEditingController());
                        _resumeController.projectDisController.add(TextEditingController());
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
                                        "Project",
                                        style: MyTextStyles.headingLargePrimary,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                            _resumeController.valueProjectController.value--;
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
                                        controller: _resumeController.projectTitleController[index],
                                        maxLines: 1,
                                        labelText: 'Title',
                                        keyboardType: TextInputType.text,
                                      ),
                                      CustomTextFormFeild(
                                        controller: _resumeController.projectDisController[index],
                                        maxLines: 3,
                                        labelText: 'Details',
                                        keyboardType: TextInputType.text,
                                        maxLenght: 120,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //_resumeController.addProject();
                      },
                    child: Text('Save'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      onPressed: () {
                          _resumeController.valueProjectController.value++;
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
