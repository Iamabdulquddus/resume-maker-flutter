import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../widgets/textformfeild.dart';

class Reference extends StatefulWidget {
  const Reference({Key? key}) : super(key: key);

  @override
  State<Reference> createState() => _ReferenceState();
}

class _ReferenceState extends State<Reference> {
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
                                      "Reference",
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
                                      labelText: 'Reference Name',
                                      keyboardType: TextInputType.name,
                                    ),
                                    CustomTextFormFeild(
                                      maxLines: 1,
                                      labelText: 'Job Title',
                                      keyboardType: TextInputType.text,
                                    ),
                                    CustomTextFormFeild(
                                      maxLines: 1,
                                      labelText: 'Company Name',
                                      keyboardType: TextInputType.name,
                                    ),
                                    CustomTextFormFeild(
                                      maxLines: 1,
                                      labelText: 'Email',
                                      keyboardType: TextInputType.emailAddress,

                                    ),
                                    CustomTextFormFeild(
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
