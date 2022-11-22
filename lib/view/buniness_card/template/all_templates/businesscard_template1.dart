import 'package:flutter/material.dart';

import '../../../../constants/images.dart';
import '../../../../constants/style.dart';

class BusinessCardTemplate1 extends StatelessWidget {
  const BusinessCardTemplate1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightColor,
        appBar: AppBar(
          title: Text(
            "Business Card Template 1",
            style: MyTextStyles.headingxSmallBoldWhite,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              Image.asset(businessCard1),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Column(
                      children: [
                        ClipOval(
                          child: Container(
                            color: Colors.white,
                            child: Image.asset(
                              resumeBro,
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Company Name',
                          style: MyTextStyles.headingLargeWhite,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Tag Line should be only 1 line ',
                          style: MyTextStyles.subHeadingWhite,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 3),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Your Name',
                          style: MyTextStyles.subHeadingBoldWhite,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 3),
                    child: Row(
                      children: [
                        Icon(
                          Icons.people_outline_sharp,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Post in the company',
                          style: MyTextStyles.subHeadingBoldWhite,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 3),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'youremailhere@gmail.com',
                          style: MyTextStyles.subHeadingBoldWhite,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 3),
                    child: Row(
                      children: [
                        Icon(
                          Icons.sports_basketball,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'yourwebsitehere.com',
                          style: MyTextStyles.subHeadingBoldWhite,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 3),
                    child: Row(
                      children: [
                        Icon(
                          Icons.house,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Youraddressoverhere max 120 keys',
                          style: MyTextStyles.subHeadingBoldWhite,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(),
                      Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(right: 10, bottom: 3, top: 55),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '03001234567',
                                  style: MyTextStyles.subHeadingBoldBlack,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                              bottom: 3,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '03001234567',
                                  style: MyTextStyles.subHeadingBoldBlack,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )

                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
