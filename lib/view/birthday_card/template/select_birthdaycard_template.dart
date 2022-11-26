import 'package:flutter/material.dart';

import '../../../constants/images.dart';
import '../../../constants/style.dart';
import 'all_templates/birthdaycard_template1.dart';

class SelectBirthdayCardTemplate extends StatelessWidget {
  const SelectBirthdayCardTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          children: [
            SelectBirthdayCardTemplateCard(imageName: businessCard1, onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BirthdayCardTemplate1()));
            },)
          ],
        ),
      ),
    );
  }
}

class SelectBirthdayCardTemplateCard extends StatelessWidget {
  const SelectBirthdayCardTemplateCard({Key? key, required this.imageName, required this.onTap}) : super(key: key);
 final String imageName;
 final  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        child: Center(
          child: Image.asset(imageName, ),
        ),
      ),
    );
  }
}

