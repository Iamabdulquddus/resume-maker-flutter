import 'package:flutter/material.dart';

import '../../constants/style.dart';
import '../../widgets/textformfeild.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
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
              Form(
                child: Column(
                  children: [
                    for (int i = 0; i < numberOfTextFields; i++)
                      Padding(
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
                                      "Experience",
                                      style: MyTextStyles.headingLargePrimary,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          numberOfTextFields--;
                                        });
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
                                  children: const [
                                    CustomTextFormFeild(
                                      maxLines: 1,
                                      labelText: 'Company Name',
                                      keyboardType: TextInputType.text,
                                    ),
                                    CustomTextFormFeild(
                                      maxLines: 1,
                                      labelText: 'Job Title',
                                      keyboardType: TextInputType.text,
                                    ),
                                    CustomTextFormFeild(
                                      maxLines: 1,
                                      labelText: 'Start (year)',
                                      keyboardType: TextInputType.number,
                                      maxLenght: 4,
                                    ),
                                    CustomTextFormFeild(
                                      maxLines: 1,
                                      labelText: 'End (year)',
                                      keyboardType: TextInputType.number,
                                      maxLenght: 4,
                                    ),
                                    CustomTextFormFeild(
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
                      )
                  ],
                ),
              ),
              Row(
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
                        setState(() {
                          numberOfTextFields++;
                        });
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
