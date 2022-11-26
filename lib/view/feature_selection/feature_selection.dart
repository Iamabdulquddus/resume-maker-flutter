import 'package:flutter/material.dart';
import 'package:resumemaker/constants/style.dart';
import '../../constants/images.dart';
import '../birthday_card/birthdaycard_home/birthdaycard_home.dart';
import '../buniness_card/buniesscard_home/businesscard_home.dart';
import '../resume/resume_home/resume_home.dart';

class FeatureSelection extends StatelessWidget {
  const FeatureSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Features",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          children: [
            FeatureSelectionItem(
              image: feature1,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResumeCardHome(),
                  ),
                );
              },
              featureHeading: 'Resume Maker',
            ),
            FeatureSelectionItem(
              image: feature2,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BusniessCardHome(),
                  ),
                );
              },
              featureHeading: 'Business Card',
            ),

            FeatureSelectionItem(
              image: feature2,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BirthdayCardHome(),
                  ),
                );
              },
              featureHeading: 'Birthday Card',
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureSelectionItem extends StatelessWidget {
  const FeatureSelectionItem({
    Key? key,
    required this.image,
    required this.onTap,
    required this.featureHeading,
  }) : super(key: key);
  final String image, featureHeading;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: primary.withOpacity(0.2),
        ),
        gradient: LinearGradient(colors: [
          Colors.white,
          tertiary.withOpacity(0.05),
        ], end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                image,
                height: 110,
                // fit: BoxFit.cover,
              ),
              Text(
                featureHeading,
                style: MyTextStyles.headingSmallPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
