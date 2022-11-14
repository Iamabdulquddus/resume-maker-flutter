import 'package:flutter/material.dart';
import 'package:resumemaker/constants/images.dart';

import 'all_templates/first_template.dart';
import '../preview/preview.dart';

class SelectTemplate extends StatelessWidget {
  const SelectTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 3,
        shrinkWrap: true,
        children: [
          SelectTemplateGridBox(),
        ],
      ),
    );
  }
}

class SelectTemplateGridBox extends StatelessWidget {
  const SelectTemplateGridBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Preview()));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        child: Center(
          child: Image.asset(resumeBro),
        ),
      ),
    );
  }
}

