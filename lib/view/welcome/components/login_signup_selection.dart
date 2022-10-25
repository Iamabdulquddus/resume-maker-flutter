import 'package:flutter/material.dart';
import 'package:resumemaker/view/login/login.dart';
import 'package:resumemaker/view/signup/signup.dart';

import '../../../constants/images.dart';
import '../../../constants/style.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              selectionScreen,
            ),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                resumeBro,
                height: 400,
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Already a member?  ',
                            style: MyTextStyles.regularBlack),
                        TextSpan(
                            text: 'Login',
                            style: MyTextStyles.headingSmallPrimary)
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage()));
                      },
                      child: Text(
                        'Sign up',
                        style: MyTextStyles.headingxSmallBoldWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
