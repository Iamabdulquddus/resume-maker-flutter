import 'package:flutter/material.dart';
import 'package:resumemaker/constants/style.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,

                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
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
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: primary,
                      size: 35,
                    ),
                    SizedBox(width: 5,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width/ 1.34,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Muhammad Abdul Quddus',
                            style: MyTextStyles.headingLargePrimary,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'resumemaker1122@gmail.com',
                            style: MyTextStyles.subHeadingGrey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const ListTile(
                title: Text("Terms & Condition"),
              ),
              const ListTile(
                title: Text("Privacy Policy"),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: (){}, child: Text('Log Out'),)),
                ],
              ),
              SizedBox(height: 25,)
            ],
          )
        ],
      ),
    );
  }
}
