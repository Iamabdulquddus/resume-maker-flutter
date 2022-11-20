import 'package:flutter/material.dart';
import 'package:resumemaker/constants/style.dart';

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
            GridView.count(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      onPressed: () {},
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
                          SizedBox(width: 10,),
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
