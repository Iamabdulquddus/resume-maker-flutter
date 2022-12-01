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

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  LoginController loginController = Get.find();




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            selectionScreen,
            fit: BoxFit.cover,
            height: size.height,
            width: size.width,
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: size.width,
                  height: size.height,
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: loginController.loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            resumeBro,
                          ),
                        ),
                        Text(
                          'Welcome',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                         // CustomTextFormFeild(
                         //
                         //   labelText: "Email",
                         //   icon: Icon(Icons.mail_outline,),
                         // ),
                        TextFormField(
                          maxLines: 1,
                          controller: loginController.loginUserEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration:  InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Email",
                            hintText: "Enter Email",
                            prefixIcon: Icon(Icons.mail_outline),
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
                           controller: loginController.loginUserPassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              hintText: "Enter password",
                              prefixIcon: Icon(Icons.lock_outline),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: primary,
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
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
                        const SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            loginController.loginWithEmailAndPassword();
                          },
                          child: Obx(
                            ()=> AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              width: loginController.loginChangeButton.value ? 50 : 130,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius:
                                    BorderRadius.circular(loginController.loginChangeButton.value ? 50 : 10),
                              ),
                              child: loginController.loginChangeButton.value
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      'Log in',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
