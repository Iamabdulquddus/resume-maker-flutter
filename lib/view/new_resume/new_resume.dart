import 'package:flutter/material.dart';
import 'package:resumemaker/constants/style.dart';

import '../home/home.dart';

class NewResume extends StatefulWidget {
  const NewResume({Key? key}) : super(key: key);

  @override
  State<NewResume> createState() => _NewResumeState();
}

class _NewResumeState extends State<NewResume> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Home() ));
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: wWhiteColor,
            ),
          ),
          title: Text(
            "Profile",
            style: MyTextStyles.headingxSmallBoldWhite,
          ),

        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [primary.withOpacity(.1), tertiary.withOpacity(0.2)],
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.count(
                  padding: EdgeInsets.all(20),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: const [
                    ProfileEntity(
                      icon: Icons.person,
                      text: 'Personal Details',
                    ),
                    ProfileEntity(
                      icon: Icons.person,
                      text: 'Education',
                    ),
                    ProfileEntity(
                      icon: Icons.person,
                      text: 'Experience',
                    ),
                    ProfileEntity(
                      icon: Icons.person,
                      text: 'Skills',
                    ),
                    ProfileEntity(
                      icon: Icons.person,
                      text: 'Objectives',
                    ),
                    ProfileEntity(
                      icon: Icons.person,
                      text: 'Reference',
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'More Sections',
                    style: MyTextStyles.headingSmallPrimary,
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      MoreSections(
                        icon: Icons.person,
                        text: 'Personal Details',
                      ),
                      MoreSections(
                        icon: Icons.person,
                        text: 'Education',
                      ),
                      MoreSections(
                        icon: Icons.person,
                        text: 'Experience',
                      ),
                      MoreSections(
                        icon: Icons.person,
                        text: 'Skills',
                      ),
                      MoreSections(
                        icon: Icons.person,
                        text: 'Objectives',
                      ),
                      MoreSections(
                        icon: Icons.person,
                        text: 'Reference',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: lightColor,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye_rounded,
                              color: primary,
                            ),
                            Text(
                              "  Preview CV",
                              style: MyTextStyles.subHeadingBoldPrimary,
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: SizedBox(
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: primary,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.remove_red_eye_rounded,
                                  color: wWhiteColor,
                                ),
                                Text(
                                  "  Generate CV",
                                  style: MyTextStyles.subHeadingBoldWhite,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}

class ProfileEntity extends StatelessWidget {
  const ProfileEntity({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: wWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(1, 2),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: primary,
            size: 35,
          ),
          // SizedBox(height: 10,),
          Text(
            text,
            style: MyTextStyles.subHeadingBoldGrey,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class MoreSections extends StatelessWidget {
  const MoreSections({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: wWhiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(1, 2),
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.grey.shade700,
              size: 35,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: MyTextStyles.subHeadingBoldGrey,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
