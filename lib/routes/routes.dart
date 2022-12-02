import 'package:get/get.dart';
import '../middleware/auth_middleware.dart';
import '../view/feature_selection/feature_selection.dart';
import '../view/resume/feilds/personal_details.dart';
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
  static String getMakeBusinessCardRoute() => busniessCardHome;
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
    GetPage(
        name: getResumeCardHomeRoute(),
        transition: Transition.circularReveal,
        page: ()=> const ResumeCardHome()
    ),

  ];
}

