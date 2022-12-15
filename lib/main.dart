import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resumemaker/rep/hive_rep.dart';
import 'package:resumemaker/routes/routes.dart';
import 'package:resumemaker/view/feature_selection/feature_selection.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bind_building/bind_building.dart';
import 'constants/style.dart';
import 'controller/login_controller.dart';
import 'controller/resume_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("user=> ${FirebaseAuth.instance.currentUser?.uid}");

  Get.put(LoginController());
  Get.put(ResumeController());


  runApp( MyApp() );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resume Maker',
      theme: ThemeData(
        fontFamily: GoogleFonts.rubik().fontFamily,
        primarySwatch: Palette.myColors,
      ),
      //home:  SafeArea(child: FeatureSelection()),
      initialRoute: FirebaseAuth.instance.currentUser?.uid != null?  MyRoutes.getFeatureSelectionRoute() : MyRoutes.getWelcome(),
      getPages: MyRoutes.appRoutes(),
      initialBinding: BindBuilding(),
    );
  }
}

