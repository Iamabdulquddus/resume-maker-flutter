import 'package:flutter/material.dart';
import '../../constants/style.dart';
import '../home/home.dart';
import 'onboarding.dart';

class Welcome extends StatelessWidget {
   const Welcome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Home()));
                },
                child: Text(
                  'skip',
                  style: MyTextStyles.headingSmallPrimary,
                ),
              ),
            ],
          ),
          const Expanded(child: OnBoarding()),
          // SizedBox(height: 10,),
          const Text('Professional resume maker on your finger tips'),
          const SizedBox(
            height: 10,
          ),

          TextButton(
              onPressed: () {
              },
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Already a member?  ',
                      style: MyTextStyles.regularBlack),
                  TextSpan(
                      text: 'Login', style: MyTextStyles.headingSmallPrimary)
                ]),
              )),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }
}
