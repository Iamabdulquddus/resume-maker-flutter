import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:resumemaker/rep/login_rep.dart';

import '../constants/firebase_constants.dart';

class LoginController extends GetxController {

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  TextEditingController sigUpUserName = TextEditingController();
  TextEditingController sigUpUserEmail = TextEditingController();
  TextEditingController sigUpUserPassword = TextEditingController();
  TextEditingController sigUpUserPassword2 = TextEditingController();

  final formKey = GlobalKey<FormState>();
  RxBool changeButton = false.obs;


  ///EMAIL VALIDATION PATTERN
  String emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";


  sigUpWithEmail() async {
    if (formKey.currentState!.validate()) {
      changeButton.value = true;
      final response = LoginAndSignUp.SignUp(
        sigUpUserEmail.text,
        sigUpUserPassword.text,
        sigUpUserName.text
      );
      if(response==WEAK_PASSEWORD){

      }else if(response==EMAIL_ALREADY_IN_USE){

      }else if(response==UNKNOWN_ERROR){

      }
      await Future.delayed(
        const Duration(seconds: 1),
      );
    }



    changeButton.value = false;
    update();
  }

  // moveToHome(BuildContext context) async {
  //   if (loginController.formKey.currentState!.validate()) {
  //     setState(() {
  //
  //     });
  //
  //
  //
  //     setState(() {
  //       loginController.
  //     });
  //   }
  // }

  Future<User?> signInWithGoogle( BuildContext context)  async {




  final GoogleSignInAccount? googleSignInAccount =
  await googleSignIn.signIn();

  if (googleSignInAccount != null) {
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
  accessToken: googleSignInAuthentication.accessToken,
  idToken: googleSignInAuthentication.idToken,
  );

  try {
  final UserCredential userCredential =
  await auth.signInWithCredential(credential);

  user = userCredential.user;
  } on FirebaseAuthException catch (e) {
  if (e.code == 'account-exists-with-different-credential') {
  // handle the error here
  }
  else if (e.code == 'invalid-credential') {
  // handle the error here
  }
  } catch (e) {
  // handle the error here
  }
  }

  return user;
  }


}