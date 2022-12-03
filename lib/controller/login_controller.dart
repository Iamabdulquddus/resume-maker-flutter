import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:resumemaker/rep/login_rep.dart';

import '../constants/firebase_constants.dart';
import '../routes/routes.dart';

class LoginController extends GetxController {

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  ///SigUp
  TextEditingController sigUpUserName = TextEditingController();
  TextEditingController sigUpUserEmail = TextEditingController();
  TextEditingController sigUpUserPassword = TextEditingController();
  TextEditingController sigUpUserPassword2 = TextEditingController();

  ///Login
  TextEditingController loginUserEmail = TextEditingController();
  TextEditingController loginUserPassword = TextEditingController();



  RxBool changeButton = false.obs;
  RxBool loginChangeButton = false.obs;
  RxString errorText = "".obs;
  RxString errorTextSigUp = "".obs;


  ///EMAIL VALIDATION PATTERN
  String emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";


  loginWithEmailAndPassword() async {
      loginChangeButton.value = true;
      final response =await LoginAndSignUp.LoginEmailAndPassword(
        loginUserEmail.text,
        loginUserPassword.text
      );
      if(response==UNKNOWN_ERROR){
        loginChangeButton.value = false;
        errorText.value = UNKNOWN_ERROR;
      }else if(response==WRONG_PASSWORD_MESSAGE){
        loginChangeButton.value = false;
        errorText.value = WRONG_PASSWORD_MESSAGE;
      }else if(response==USER_NOT_FOUND_MESSAGE){
        loginChangeButton.value = false;
        errorText.value = USER_NOT_FOUND_MESSAGE;
      }else if(response==LOGIN_SUCCESSFULLY){
        errorText.value = "";
        loginChangeButton.value = false;
        Get.offAllNamed(MyRoutes.getFeatureSelectionRoute());
      }
      await Future.delayed(
        const Duration(seconds: 1),
      );
  }


  sigUpWithEmail() async {
      changeButton.value = true;
      final response =await LoginAndSignUp.SignUp(
          sigUpUserName.text,
          sigUpUserEmail.text,
          sigUpUserPassword.text
      );

      if(response==WEAK_PASSEWORD){
        changeButton.value = false;
        errorTextSigUp.value = WEAK_PASSEWORD_MESSAGE;
      }else if(response==EMAIL_ALREADY_IN_USE){
        print(response);
        changeButton.value = false;
        errorTextSigUp.value = EMAIL_ALREADY_IN_USE_MESSAGE;
      }else if(response==INVALID_EMAIL){
        changeButton.value = false;
        errorTextSigUp.value = ENTER_EMAIL_ACCOURDING_TO_PATTERN;
      }else if(response==UNKNOWN_ERROR){
        changeButton.value = false;
        errorTextSigUp.value = USER_NOT_FOUND_MESSAGE;
      }else if(response==SIG_UN_SUCCESSFULLY){
        errorTextSigUp.value ="";
        changeButton.value = false;
        Get.offAllNamed(MyRoutes.getFeatureSelectionRoute());
      }
      await Future.delayed(
        const Duration(seconds: 1),
      );
  }




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