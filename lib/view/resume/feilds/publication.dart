import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/style.dart';
import '../../../controller/resume_controller.dart';
import '../../../widgets/textformfeild.dart';

class Publication extends StatefulWidget {
  const Publication({Key? key}) : super(key: key);

  @override
  State<Publication> createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {
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
          "Publication",
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
                          itemCount: _resumeController.valuePublicationController.value,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){
                            _resumeController.publicationTitleController.add(TextEditingController());
                            _resumeController.publicationDisController.add(TextEditingController());
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
                                            "Publication",
                                            style: MyTextStyles.headingLargePrimary,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                                _resumeController.valuePublicationController.value--;
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
                                            controller: _resumeController.publicationTitleController[index],
                                            maxLines: 1,
                                            labelText: 'Title',
                                            keyboardType: TextInputType.text,
                                          ),
                                          CustomTextFormFeild(
                                            controller: _resumeController.publicationDisController[index],
                                            maxLines: 1,
                                            labelText: 'Description',
                                            keyboardType: TextInputType.text,
                                            maxLenght: 50,
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
                      onPressed: () {
                        _resumeController.addPublish();
                      },
                      child: Text('Save'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextButton(
                        onPressed: () {
                            _resumeController.valuePublicationController.value++;
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
