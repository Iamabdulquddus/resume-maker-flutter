import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resumemaker/constants/style.dart';
import '../../constants/images.dart';
import '../feilds/education.dart';
import '../feilds/experience.dart';
import '../feilds/objective.dart';
import '../feilds/personal_details.dart';
import '../feilds/project.dart';
import '../feilds/publication.dart';
import '../feilds/reference.dart';
import '../feilds/skills_interest_activites.dart';
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
            "Profile",
            style: MyTextStyles.headingxSmallBoldWhite,
          ),
        ),
        body: SingleChildScrollView(
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
                    name: personal,
                    text: 'BASICS',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PersonalDetails()));
                    },
                  ),
                  ProfileEntity(
                   name: education,
                    text: 'EDUCATION',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Education()));
                    },
                  ),
                  ProfileEntity(
                   name: experience,
                    text: 'EXPERIENCE',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Experience()));
                    },
                  ),
                  ProfileEntity(
                    name: skills,
                    text: 'SKILLS',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SkillsInterestActivities(
                                field: 'Skill',
                              )));
                    },
                  ),
                  ProfileEntity(
                   name: objectives,
                    text: 'OBJECTIVES',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Objectives()));
                    },
                  ),
                  ProfileEntity(
                    name: reference,
                    text: 'REFERENCE',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Reference()));
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
                    children: [
                      MoreSections(
                        icon: FaIcon(
                          FontAwesomeIcons.thumbsUp,
                          color: Colors.grey.shade700,
                          size: 30,
                        ),
                        text: 'Interests',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SkillsInterestActivities(
                                field: 'Interest',
                              ),
                            ),
                          );
                        },
                      ),
                      MoreSections(
                        icon: FaIcon(
                          FontAwesomeIcons.diagramProject,
                          color: Colors.grey.shade700,
                          size: 30,
                        ),
                        text: 'Projects',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Projects(),
                            ),
                          );
                        },
                      ),
                      MoreSections(
                        icon: FaIcon(
                          FontAwesomeIcons.language,
                          color: Colors.grey.shade700,
                          size: 30,
                        ),
                        text: 'Language',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SkillsInterestActivities(
                                field: 'Language',
                              ),
                            ),
                          );
                        },
                      ),
                      MoreSections(
                        icon: FaIcon(
                          FontAwesomeIcons.trophy,
                          color: Colors.grey.shade700,
                          size: 30,
                        ),
                        text: 'Achievements & Awards',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SkillsInterestActivities(
                                field: 'Achievements & Awards',
                              ),
                            ),
                          );
                        },
                      ),
                      MoreSections(
                        icon: FaIcon(
                          FontAwesomeIcons.personRunning,
                          color: Colors.grey.shade700,
                          size: 30,
                        ),
                        text: 'Activities',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SkillsInterestActivities(
                                field: 'Activities',
                              ),
                            ),
                          );
                        },
                      ),
                      MoreSections(
                        icon: FaIcon(
                          FontAwesomeIcons.graduationCap,
                          color: Colors.grey.shade700,
                          size: 30,
                        ),
                        text: 'Publication',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Publication(),
                            ),
                          );
                        },
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
                        backgroundColor: wWhiteColor,
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
    );
  }
}
