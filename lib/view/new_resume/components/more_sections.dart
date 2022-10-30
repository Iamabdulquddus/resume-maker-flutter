import 'package:flutter/material.dart';

import '../../../constants/style.dart';


class MoreSections extends StatelessWidget {
  const MoreSections({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: wWhiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(1, 2),
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.grey.shade700,
              size: 35,
            ),
           const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: MyTextStyles.subHeadingBoldGrey,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
