import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:resumemaker/constants/style.dart';
import 'package:resumemaker/controller/resume_controller.dart';
import 'package:resumemaker/routes/routes.dart';

import 'components/resume_about.dart';
import 'components/resume_generated_pdf.dart';
import 'components/resume_home_list_item.dart';



class ResumeCardHome extends StatefulWidget {
  const ResumeCardHome({Key? key}) : super(key: key);

  @override
  State<ResumeCardHome> createState() => _ResumeCardHomeState();
}

class _ResumeCardHomeState extends State<ResumeCardHome> {
  ResumeController resumeController = Get.find();
  List<Widget> tabItems = [
    ResumeCardHomeListItem(),
    ResumeCardGeneratedPDF(),
    ResumeCardAbout(),
  ];

  int? currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Maker'),
      ),
      body: Center(
        child: tabItems[currentIndex!],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await resumeController.getResumeId();
          Get.toNamed(MyRoutes.getNewResumeRoute());
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        elevation: 10,
        tilesPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        items: const <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: primary,
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              // color: Colors.red,
            ),
            title: Text("Home"),
          ),
          BubbleBottomBarItem(
              backgroundColor: primary,
              icon: Icon(
                Icons.download,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.download,
              ),
              title: Text("Downloads"),),
          BubbleBottomBarItem(
              backgroundColor: primary,
              icon: FaIcon(FontAwesomeIcons.info, color: Colors.black,),
              activeIcon:  FaIcon(FontAwesomeIcons.info, ),
              title: Text("About"),),
        ],
      ),
    );
  }
}