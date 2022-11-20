import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../widgets/textformfeild.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
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
                                      "Education",
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
                                      labelText: 'Degree / Course',
                                      keyboardType: TextInputType.text,
                                    ),
                                    CustomTextFormFeild(
                                      maxLines: 1,
                                      labelText: 'School / Universiy',
                                      keyboardType: TextInputType.text,
                                    ),
                                    CustomTextFormFeild(
                                      maxLines: 1,
                                      labelText: 'Marks / CGPA',
                                      keyboardType: TextInputType.text,
                                    ),
                                    CustomTextFormFeild(
                                      maxLines: 1,
                                      labelText: 'From (year)',
                                      keyboardType: TextInputType.text,
                                      maxLenght: 4,
                                    ),
                                    CustomTextFormFeild(
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
