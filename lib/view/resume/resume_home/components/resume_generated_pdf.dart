import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants/style.dart';

class ResumeCardGeneratedPDF extends StatelessWidget {
  const ResumeCardGeneratedPDF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Container(
            // height: 40,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: wWhiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 1),
                  ),
                  BoxShadow(
                    color: lightColor,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(-1, -1),
                  ),
                ]),
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.filePdf,
                color: primary,
                size: 30,
              ),
              title: Text(
                'Resume Maker ${DateTime.now()
                    .toString()
                    .substring(0,16)}',
                style: MyTextStyles.headingSmallPrimary,
                overflow: TextOverflow.visible,
              ),
              trailing: PopupMenuButton<int>(
                  itemBuilder: (context) {
                    return <PopupMenuEntry<int>>[
                      PopupMenuItem(child: Text('Share'), value: 0),
                      PopupMenuItem(child: Text('Delete'), value: 1),
                    ];
                  },
                child: FaIcon(FontAwesomeIcons.ellipsisVertical, color: primary,),
            ),
          ),),
        ],
      ),
    );
  }
}
