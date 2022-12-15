import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:resumemaker/constants/sqflite_constants.dart';
import 'package:resumemaker/constants/style.dart';
import 'package:resumemaker/controller/resume_controller.dart';
import '../../../constants/images.dart';
import '../../../routes/routes.dart';
import 'components/more_sections.dart';
import 'components/profile_entity.dart';

class NewResume extends StatefulWidget {
  const NewResume({Key? key}) : super(key: key);

  @override
  State<NewResume> createState() => _NewResumeState();
}

class _NewResumeState extends State<NewResume> {
  ResumeController resumeController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(resumeController.resumeId.value);
  }
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
            "Resume",
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
                      Get.toNamed(MyRoutes.getPersonalDetailsRoute());
                    },
                  ),
                  ProfileEntity(
                   name: education,
                    text: 'EDUCATION',
                    onTap: () {
                      Get.toNamed(MyRoutes.getEducationRoute());
                    },
                  ),
                  ProfileEntity(
                   name: experience,
                    text: 'EXPERIENCE',
                    onTap: () {
                      Get.toNamed(MyRoutes.getExperienceRoute());
                    },
                  ),
                  ProfileEntity(
                    name: skills,
                    text: 'SKILLS',
                    onTap: () {
                      Get.toNamed(
                          MyRoutes.getSkillsInterestActivitiesRoute(),
                          arguments: {SQ_USER_COMMON_ACTIVITY_TYPE:"Skills"});
                      // Get.toNamed(const SkillsInterestActivities(
                      //   field: 'Skill',
                      // ));
                    },
                  ),
                  ProfileEntity(
                   name: objectives,
                    text: 'OBJECTIVES',
                    onTap: () {
                      Get.toNamed(MyRoutes.getObjectivesRoute());
                    },
                  ),
                  ProfileEntity(
                    name: reference,
                    text: 'REFERENCE',
                    onTap: () {
                      Get.toNamed(MyRoutes.getReferenceRoute());
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
                          Get.toNamed(
                              MyRoutes.getSkillsInterestActivitiesRoute(),
                              arguments: {SQ_USER_COMMON_ACTIVITY_TYPE:"Interests"});
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
                          Get.toNamed(MyRoutes.getProjectsRoute());
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
                          Get.toNamed(
                              MyRoutes.getSkillsInterestActivitiesRoute(),
                              arguments: {SQ_USER_COMMON_ACTIVITY_TYPE:"Languages"});

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
                          Get.toNamed(
                              MyRoutes.getSkillsInterestActivitiesRoute(),
                              arguments: {SQ_USER_COMMON_ACTIVITY_TYPE:"Achievements & Awards"});

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
                          Get.toNamed(
                              MyRoutes.getSkillsInterestActivitiesRoute(),
                              arguments: {SQ_USER_COMMON_ACTIVITY_TYPE:"Activities"});
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
                          Get.toNamed(MyRoutes.getPublicationRoute());
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
