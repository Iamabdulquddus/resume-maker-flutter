import 'package:flutter/material.dart';
import 'package:resumemaker/routes/routes.dart';
import 'package:resumemaker/view/welcome/components/login.dart';
import 'package:resumemaker/view/welcome/components/signup.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/images.dart';
import 'package:get/get.dart';
import '../../../constants/style.dart';
import '../../../controller/login_controller.dart';

class SelectionScreen extends StatelessWidget {
  LoginController loginController = Get.find();


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
                      Get.toNamed(MyRoutes.getSignupRoute());
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => SignupPage()));
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
                      onPressed: () {
                        loginController.signInWithGoogle(context);
                        print("login complete ${loginController.user?.email}");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size( MediaQuery.of(context).size.width - 40 , 50)
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.red.shade800,
                      ),
                      label:
                      //loginController.user?.email == null ?
                          Text("Signup with Google", style: MyTextStyles.headingxSmallBoldPrimary,)
                      //:
                        //  Text("login complete ${loginController.user?.email}", style: MyTextStyles.headingxSmallBoldPrimary,)

                      ,
                  //  ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(MyRoutes.getLoginRoute());
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => LoginPage()));
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
