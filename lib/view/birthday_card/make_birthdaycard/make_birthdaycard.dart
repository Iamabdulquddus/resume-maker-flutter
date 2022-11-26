import 'package:flutter/material.dart';
import 'package:resumemaker/constants/style.dart';

import '../../../widgets/pick_image.dart';
import '../../../widgets/textformfeild.dart';
import '../template/select_birthdaycard_template.dart';

class MakeBirthdayCard extends StatefulWidget {
  const MakeBirthdayCard({Key? key}) : super(key: key);

  @override
  State<MakeBirthdayCard> createState() => _MakeBirthdayCardState();
}

class _MakeBirthdayCardState extends State<MakeBirthdayCard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightColor,
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
            "Birthday Card Maker",
            style: MyTextStyles.headingxSmallBoldWhite,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 150,
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Text(
                    'Birthday Card Image',
                    style: MyTextStyles.headingLargePrimary,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const PickImage(),
                  const CustomTextFormFeild(
                    maxLines: 1,
                    labelText: 'Person Name',
                    keyboardType: TextInputType.text,
                    icon: Icon(Icons.person),
                  ),
                  const CustomTextFormFeild(
                    maxLines: 1,
                    labelText: 'Wishing line (optional)',
                    keyboardType: TextInputType.text,
                    maxLenght: 150,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SelectBirthdayCardTemplate(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: primary,
                          foregroundColor: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.picture_as_pdf_outlined,
                            color: wWhiteColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Generate",
                            style: MyTextStyles.subHeadingBoldWhite,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
