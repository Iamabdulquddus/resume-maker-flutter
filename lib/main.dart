import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resumemaker/routes/routes.dart';
import 'package:resumemaker/view/feature_selection/feature_selection.dart';

import 'bind_building/bind_building.dart';
import 'constants/style.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      initialRoute: MyRoutes.getWelcome(),
      getPages: MyRoutes.appRoutes(),
      initialBinding: BindBuilding(),
    );
  }
}

