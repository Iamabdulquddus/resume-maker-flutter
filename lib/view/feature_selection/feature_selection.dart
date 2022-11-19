import 'package:flutter/material.dart';
import 'package:resumemaker/constants/style.dart';
import 'package:resumemaker/view/templates/template_name.dart';
import '../../constants/images.dart';
import '../home/home.dart';
import '../preview/preview.dart';

class FeatureSelection extends StatelessWidget {
  const FeatureSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Features",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: [
            FeatureSelectionItem(
              image: feature1,
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureSelectionItem extends StatelessWidget {
  const FeatureSelectionItem(
      {Key? key, required this.image, required this.onTap, })
      : super(key: key);
  final String image;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, tertiary.withOpacity(0.3)],
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
