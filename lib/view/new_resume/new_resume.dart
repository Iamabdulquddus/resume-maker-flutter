import 'package:flutter/material.dart';
import 'package:resumemaker/constants/style.dart';

import '../feilds/education.dart';
import '../feilds/experience.dart';
import '../feilds/personal_details.dart';
import '../home/home.dart';
import 'components/more_sections.dart';
import 'components/profile_entity.dart';

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
              Navigator.of(context).pop();
            },
            icon: const Icon(
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
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: [
                    ProfileEntity(
                      icon: Icons.person,
                      text: 'Personal Details',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PersonalDetails()));
                      },
                    ),
                    ProfileEntity(
                      icon: Icons.person,
                      text: 'Education',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Education()));
                      },
                    ),
                    ProfileEntity(
                      icon: Icons.person,
                      text: 'Experience',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Experience()));
                      },
                    ),
                    ProfileEntity(
                      icon: Icons.person,
                      text: 'Skills',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewResume()));
                      },
                    ),
                    ProfileEntity(
                      icon: Icons.person,
                      text: 'Objectives',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewResume()));
                      },
                    ),
                    ProfileEntity(
                      icon: Icons.person,
                      text: 'Reference',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewResume()));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'More Sections',
                    style: MyTextStyles.headingSmallPrimary,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: const [
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
                        MoreSections(
                          icon: Icons.person,
                          text: 'Reference',
                        ),
                        MoreSections(
                          icon: Icons.person,
                          text: 'Reference',
                        ),
                        MoreSections(
                          icon: Icons.person,
                          text: 'Reference',
                        ),
                      ],
                    ),
                  ),
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
                          backgroundColor: lightColor,
                        ),
                        child: Row(
                          children: [
                            const Icon(
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
