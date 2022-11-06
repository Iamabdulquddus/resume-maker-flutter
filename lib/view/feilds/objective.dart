import 'package:flutter/material.dart';

import '../../constants/style.dart';
import '../../widgets/textformfeild.dart';

class Objectives extends StatefulWidget {
  const Objectives({Key? key}) : super(key: key);

  @override
  State<Objectives> createState() => _ObjectivesState();
}

class _ObjectivesState extends State<Objectives> {
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
          "Objective",
          style: MyTextStyles.headingxSmallBoldWhite,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: lightColor
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
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
                      children: [
                        Text(
                          "Objective",
                          style: MyTextStyles.headingLargePrimary,
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
                          maxLines: 3,
                          labelText: 'Objective',
                          keyboardType: TextInputType.text,
                          maxLenght: 150,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
