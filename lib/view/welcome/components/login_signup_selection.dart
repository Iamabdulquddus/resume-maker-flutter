import 'package:flutter/material.dart';
import 'package:resumemaker/view/welcome/components/login.dart';
import 'package:resumemaker/view/welcome/components/signup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignupPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size( MediaQuery.of(context).size.width - 40 , 50),
                    ),
                    icon: FaIcon(Icons.email_rounded),
                    label: Text(
                      'Signup with Email',
                      style: MyTextStyles.headingxSmallBoldWhite,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size( MediaQuery.of(context).size.width - 40 , 50)
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.red.shade800,
                    ),
                    label: Text("Signup with Google", style: MyTextStyles.headingxSmallBoldPrimary,),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginPage()));
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
