import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../../constants/style.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length),),),);
    Widget svgCode = randomAvatar('${getRandomString(10)}',
        trBackground: true, height: 150, width: 150);
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: wWhiteColor,
            ),
          ),
          title: Text(
            "Profile",
            style: MyTextStyles.headingxSmallBoldWhite,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: primary, width: 5)),
                  child: CircleAvatar(
                    backgroundColor: primary.withOpacity(0.3),
                    child: svgCode,
                    radius: 75,
                  )),
              SizedBox(
                height: 20,
              ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: primary,
                    ),
                    title: Text(
                      'Muhammad Abdul Quddus',
                      style: MyTextStyles.headingSmallPrimary,
                    ),
                  )),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.email_rounded,
                      color: primary,
                    ),
                    title: Text(
                      'resumemaker1122@gmail.com',
                      style: MyTextStyles.subHeadingGrey,
                    ),
                  )),

              Card(
                margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                color: Colors.white,
                child: ListTile(
                  leading:Text(
                    'Total generated resume:',
                    style: MyTextStyles.subHeadingGrey,
                  ),
                  trailing: Text(
                    '10',
                    style: MyTextStyles.headingxSmallBoldPrimary,
                  ),
                ),
              ),

              Card(
                margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                color: Colors.white,
                child: ListTile(
                  leading: Text(
                    'Total resume made:',
                    style: MyTextStyles.subHeadingGrey,
                  ),
                  trailing: Text(
                    '10',
                    style: MyTextStyles.headingxSmallBoldPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
