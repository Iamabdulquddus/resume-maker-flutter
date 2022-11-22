import 'package:flutter/material.dart';
import 'package:resumemaker/constants/style.dart';

import '../../../widgets/pick_image.dart';
import '../../../widgets/textformfeild.dart';
import '../template/select_businesscard_template.dart';

class MakeBusinessCard extends StatefulWidget {
  const MakeBusinessCard({Key? key}) : super(key: key);

  @override
  State<MakeBusinessCard> createState() => _MakeBusinessCardState();
}

class _MakeBusinessCardState extends State<MakeBusinessCard> {
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
            "Business Card",
            style: MyTextStyles.headingxSmallBoldWhite,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height- 150,
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Text(
                    'Business Card Logo',
                    style: MyTextStyles.headingLargePrimary,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const PickImage(),
                  const CustomTextFormFeild(
                    maxLines: 1,
                    labelText: 'Company Title',
                    keyboardType: TextInputType.text,
                  ),
                  const CustomTextFormFeild(
                    maxLines: 1,
                    labelText: 'Taq Line',
                    keyboardType: TextInputType.text,
                    maxLenght: 100,
                  ),
                  const CustomTextFormFeild(
                    maxLines: 1,
                    labelText: 'Your Name',
                    keyboardType: TextInputType.text,
                  ),
                  const CustomTextFormFeild(
                    maxLines: 1,
                    labelText: 'Post',
                    keyboardType: TextInputType.text,
                  ),
                  const CustomTextFormFeild(
                    maxLines: 1,
                    labelText: 'Phone',
                    maxLenght: 11,
                    keyboardType: TextInputType.phone,
                  ),
                  const CustomTextFormFeild(
                    maxLines: 1,
                    labelText: 'Phone (optional)',
                    maxLenght: 11,
                    keyboardType: TextInputType.phone,
                  ),
                  const CustomTextFormFeild(
                    maxLines: 1,
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const CustomTextFormFeild(
                    maxLines: 1,
                    labelText: 'Website',
                    keyboardType: TextInputType.url,
                  ),
                  const CustomTextFormFeild(
                    maxLines: 2,
                    labelText: 'Address',
                    maxLenght: 110,
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: wWhiteColor,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.remove_red_eye_rounded,
                          color: primary,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Preview",
                          style: MyTextStyles.subHeadingBoldPrimary,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectBusinessCardTemplate()));
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