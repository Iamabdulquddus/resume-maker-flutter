// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:async';
import '../../../constants/images.dart';
import '../../../constants/style.dart';
import 'dart:ui' as ui;
import '../../../controller/login_controller.dart';
import '../../../widgets/textformfeild.dart';
import '../../feature_selection/feature_selection.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

String name = '';

//TextController to read text entered in text field



class _SignupPageState extends State<SignupPage> with TickerProviderStateMixin {
  LoginController loginController = Get.find();

  GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: 'formKey');
  void signUp() {
    if (formKey.currentState!.validate()) {
      loginController.sigUpWithEmail();
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
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome $name',
                          style: MyTextStyles.sectionTitleSmallPrimary,
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: loginController.sigUpUserName,
                          decoration:  InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Name",
                            hintText: "Enter Name",
                            prefixIcon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                5.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Name";
                            }
                            return null;
                          },
                        ),

                         SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: loginController.sigUpUserEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration:  InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Email",
                            hintText: "Enter Email",
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                5.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }else if(!RegExp(loginController.emailPattern).hasMatch(value)){
                              return "Enter Correct Email";
                            }
                            return null;
                          },
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: loginController.sigUpUserPassword,
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
                          controller: loginController.sigUpUserPassword2,
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
                              return "Password can't be empty";
                            }else if(value!=loginController.sigUpUserPassword.text){
                              return "Password not match";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: ()  {
                            signUp();
                          //moveToHome(context);
                          },
                          child: Obx(
                            ()=> AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              width: loginController.changeButton.value ? 40 : 130,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius:
                                BorderRadius.circular(loginController.changeButton.value ? 40 : 10),
                              ),
                              child: loginController.changeButton.value
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
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        Obx(() => Text("${loginController.errorTextSigUp.value}")),

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
