import 'package:get/get.dart';
import 'package:resumemaker/view/resume/feilds/experience.dart';
import 'package:resumemaker/view/resume/feilds/objective.dart';
import 'package:resumemaker/view/resume/feilds/project.dart';
import 'package:resumemaker/view/resume/feilds/publication.dart';
import 'package:resumemaker/view/resume/feilds/reference.dart';
import 'package:resumemaker/view/resume/new_resume/new_resume.dart';
import 'package:resumemaker/view/resume/preview/preview.dart';
import 'package:resumemaker/view/resume/templates/all_templates/first_template.dart';
import 'package:resumemaker/view/resume/templates/select_template.dart';
import '../middleware/auth_middleware.dart';
import '../view/buniness_card/buniesscard_home/businesscard_home.dart';
import '../view/buniness_card/make_businesscard/make_businesscard.dart';
import '../view/buniness_card/template/select_businesscard_template.dart';
import '../view/feature_selection/feature_selection.dart';
import '../view/resume/feilds/education.dart';
import '../view/resume/feilds/personal_details.dart';
import '../view/resume/feilds/skills_interest_activites.dart';
import '../view/resume/resume_home/resume_home.dart';
import '../view/welcome/components/login.dart';
import '../view/welcome/components/signup.dart';
import '../view/welcome/welcome.dart';

class MyRoutes {
  /// welcome screen comes first as initial route
  /// these are all the basic routes
  static String welcome = '/welcome'; //Welcome()
  static String login = '/login'; //LoginPage()
  static String signup = '/signup'; //SignupPage()
  static String featureSelection = '/feature_selection'; //FeatureSelection()

  ///Now all the routes of the Resume
  //this ResumeCardHome is the home page for resume side of the app
  static String resumeCardHome = '/resume_card_home'; //ResumeCardHome()
  //this NewResume is added on the floating action button form first tab of resume home
  static String newResume = '/new_resume'; //NewResume()

  ///Now all the text Fields of the Resume builder
  ///
  static String personalDetails = '/personal_details'; //PersonalDetails()
  static String education = '/education'; //Education()
  static String experience = '/experience'; //Experience()
  static String objectives = '/objectives'; //Objectives()
  static String projects = '/projects'; //Projects()
  static String publication = '/publication'; //Publication()
  static String reference = '/reference'; //Reference()
  static String skillsInterestActivities =
      '/skills_interest_activities'; //SkillsInterestActivities()

  /// this route to preview the resume resumetemplate
  static String preview = '/preview'; //Preview()

  /// this route to preview the resume resumetemplate
  static String selectResumeTemplate =
      '/select_resume_template'; //SelectResumeTemplate()

  /// Now all the business card routes
  /// Homeroute on business card
  static String busniessCardHome = '/busniess_card_home'; //BusniessCardHome()
  // Textformfields of businesscard..
  static String makeBusinessCard = '/make_business_card'; //MakeBusinessCard()
  //all templates of business card
  static String selectBusinessCardTemplate =
      '/select_business_card_template'; //SelectBusinessCardTemplate()

  static String getWelcome() => welcome;
  static String getLoginRoute() => login;
  static String getSignupRoute() => signup;

  static String getFeatureSelectionRoute() => featureSelection;

  static String getResumeCardHomeRoute() => resumeCardHome;
  static String getNewResumeRoute() => newResume;

  static String getPersonalDetailsRoute() => personalDetails;
  static String getEducationRoute() => education;
  static String getExperienceRoute() => experience;
  static String getObjectivesRoute() => objectives;
  static String getProjectsRoute() => projects;
  static String getPublicationRoute() => publication;
  static String getReferenceRoute() => reference;
  static String getSkillsInterestActivitiesRoute() => skillsInterestActivities;

  static String getSelectResumeTemplateRoute() => selectResumeTemplate;
  static String getPreviewRoute() => preview;

  static String getBusniessCardHomeRoute() => busniessCardHome;
  static String getMakeBusinessCardRoute() => makeBusinessCard;
  static String getSelectBusinessCardTemplateRoute() => selectBusinessCardTemplate;

  static List<GetPage> appRoutes() => [

    GetPage(
        name: getWelcome(),
        middlewares: [AuthMiddleware()],
        transition: Transition.topLevel,
        page: ()=> const Welcome()
    ),
    GetPage(
        name: getLoginRoute(),
        transition: Transition.topLevel,
        page: ()=> const LoginPage()
    ),
    GetPage(
        name: getSignupRoute(),
        transition: Transition.topLevel,
        page: ()=> const SignupPage()
    ),
    GetPage(
        name: getFeatureSelectionRoute(),
        transition: Transition.circularReveal,
        page: ()=> const FeatureSelection()
    ),
    GetPage(
        name: getPersonalDetailsRoute(),
        transition: Transition.circularReveal,
        page: ()=> const PersonalDetails()
    ),
    ///Now all the routes of the Resume
    ///Resume Home page
    GetPage(
        name: getResumeCardHomeRoute(),
        transition: Transition.circularReveal,
        page: ()=> const ResumeCardHome(),
    ),
    GetPage(
        name: getNewResumeRoute(),
        transition: Transition.circularReveal,
        page: ()=> const NewResume()
    ),
    GetPage(
        name: getPersonalDetailsRoute(),
        transition: Transition.circularReveal,
        page: ()=> const PersonalDetails()
    ),
    GetPage(
        name: getEducationRoute(),
        transition: Transition.circularReveal,
        page: ()=> Education()
    ),
    GetPage(
        name: getExperienceRoute(),
        transition: Transition.circularReveal,
        page: ()=> const Experience()
    ),
    GetPage(
        name: getObjectivesRoute(),
        transition: Transition.circularReveal,
        page: ()=> const Objectives()
    ),
    GetPage(
        name: getProjectsRoute(),
        transition: Transition.circularReveal,
        page: ()=> const Projects()
    ),
    GetPage(
        name: getPublicationRoute(),
        transition: Transition.circularReveal,
        page: ()=> const Publication()
    ),
    GetPage(
        name: getReferenceRoute(),
        transition: Transition.circularReveal,
        page: ()=> const Reference()
    ),
    GetPage(
        name: getSkillsInterestActivitiesRoute(),
        transition: Transition.circularReveal,
        page: ()=> const SkillsInterestActivities(field: '',)
    ),
    // GetPage(
    //     name: getPreviewRoute(),
    //     transition: Transition.circularReveal,
    //     page: ()=> Preview(template:  ,)
    // ),
    GetPage(
        name: getSelectResumeTemplateRoute(),
        transition: Transition.circularReveal,
        page: ()=> const SelectResumeTemplate()
    ),

    ///Business Card
    GetPage(
      name: getBusniessCardHomeRoute(),
      transition: Transition.circularReveal,
      page:()=> const BusniessCardHome(),
    ),
    GetPage(
      name: getMakeBusinessCardRoute(),
      transition: Transition.circularReveal,
      page:()=> const MakeBusinessCard(),
    ),
    GetPage(
      name: getSelectBusinessCardTemplateRoute(),
      transition: Transition.circularReveal,
      page:()=> const SelectBusinessCardTemplate(),
    )




  ];
}

