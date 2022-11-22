import 'package:flutter/material.dart';
import '../../../../constants/images.dart';
import '../../../../constants/style.dart';

class BusinessCardHomeListItem extends StatelessWidget {
  const BusinessCardHomeListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            // elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: lightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          resumeBro,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          // height: 90,
                          // color: secondary,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Muhammad Abdul Quddus',
                                style: MyTextStyles.headingLargePrimary,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Angelayu@gmail.com',
                                style: MyTextStyles.headingxSmallGrey,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text('03004400443',
                                  style: MyTextStyles.headingxSmallGrey),
                              Text('Oct 25, 2022 02:18 pm',
                                  style: MyTextStyles.headingxSmallGrey),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: secondary.withOpacity(0.3),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: lightColor,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10)),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.edit,
                                    color: primary,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Edit",
                                    style: MyTextStyles.headingSmallPrimary,
                                  )
                                ],
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: lightColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10)),
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
                                  "View",
                                  style: MyTextStyles.headingSmallPrimary,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.more_vert,
                        color: primary,
                        size: 25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
