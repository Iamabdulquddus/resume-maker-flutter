import 'package:flutter/material.dart';
import 'package:resumemaker/constants/images.dart';
import 'package:resumemaker/view/templates/template_name.dart';

import 'all_templates/first_template.dart';
import '../preview/preview.dart';

class SelectTemplate extends StatelessWidget {
  const SelectTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: templateName.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Preview(
                            template: templateName[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      color: Colors.black12,
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
