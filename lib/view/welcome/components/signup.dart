// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:async';
import '../../../constants/images.dart';
import '../../../constants/style.dart';
import 'dart:ui' as ui;
import '../../../widgets/textformfeild.dart';
import '../../feature_selection/feature_selection.dart';
import '../../home/home.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

String name = '';
bool changeButton = false;
//TextController to read text entered in text field

final _formKey = GlobalKey<FormState>();

class _SignupPageState extends State<SignupPage> with TickerProviderStateMixin {

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(
        const Duration(seconds: 1),
      );
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => FeatureSelection()));
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            selectionScreen,
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: size.width,
                  height: size.height,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color: Colors.white.withOpacity(.2),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome $name',
                          style: MyTextStyles.sectionTitleSmallPrimary,
                        ),
                        SizedBox(height: 20,),
                        CustomTextFormFeild(
                          icon: Icon(Icons.person_outline),
                          labelText: "Name",
                          keyboardType: TextInputType.name,
                          onChange: (value) {
                            setState(() {
                              name = value;
                            });
                          }, maxLines: 1,
                        ),
                         SizedBox(
                          height: 10,
                        ),
                        CustomTextFormFeild(
                          labelText: "Email",
                          icon: Icon(Icons.email_outlined),
                          keyboardType: TextInputType.emailAddress, maxLines: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,

                          decoration:  InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Password",
                            hintText: "Enter password",
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                5.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password can't be empty";
                            } else if (value.length < 6) {
                              return "length should be atleast 6";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration:  InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Confirm password",
                            hintText: "Enter password again",
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                5.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please re-enter password';
                            }
                            // if (loginSingupController.createAccountPassword.text !=  loginSingupController.createAccountConfirmPassword.text) {
                            //   return "Password does not match";
                            // }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: ()  {
                            // loginSingupController.createUserAccount();
                          moveToHome(context);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changeButton ? 40 : 130,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius:
                              BorderRadius.circular(changeButton ? 40 : 10),
                            ),
                            child: changeButton
                                ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                                : const Text(
                              'Sign up',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
