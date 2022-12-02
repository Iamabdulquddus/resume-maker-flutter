import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resumemaker/rep/hive_rep.dart';

import '../constants/firebase_constants.dart';
import '../models/user_list_model.dart';

class LoginAndSignUp {


  static Future LoginEmailAndPassword (String email, String password) async {
    try{
      final credential = await FirebaseAuth
          .instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(credential.credential);
      print(credential.user);
      String? signInMethod = credential.credential?.signInMethod ?? "email";
      HiveRep.SaveUserInfo(
          credential.user?.uid,
          credential.user?.email,
          password,
          signInMethod
      );
      print("signInMethod ${credential.credential?.signInMethod}");
      return LOGIN_SUCCESSFULLY;
    }on FirebaseAuthException catch(e){
      if(e.code==WRONG_PASSWORD){
        print(e.code);
        return WRONG_PASSWORD_MESSAGE;
      }else if(e.code==USER_NOT_FOUND){
        print(e.code);
        return USER_NOT_FOUND_MESSAGE;
      }else{
        print(e);
        return UNKNOWN_ERROR;
      }
    }
    catch (e){
      print("FirebaseAuthException $e");
      return UNKNOWN_ERROR;
    }
  }

  static Future SignUp(String name, String emailAddress,String password ) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print("credential=> ${credential.user?.email}");
      if(credential.user?.email!=null){
        UserListModel(
          userName: name,
          userEmail: emailAddress,
          password: password,
          signInMethod: credential.credential?.signInMethod,
        ).toJson();
        FirebaseFirestore.instance.collection("users")
            .doc(credential.user?.uid)
            .set(
            UserListModel(
              userName: name,
              userEmail: emailAddress,
              password: password,
              signInMethod: credential.credential?.signInMethod,
            ).toJson()).onError((e, _) => print("Error writing document: $e"));

      }
      return SIG_UN_SUCCESSFULLY;
    } on FirebaseAuthException catch (e) {
      if (e.code == WEAK_PASSEWORD) {
        print('The password provided is too weak.');
        return e.code;
      } else if (e.code == EMAIL_ALREADY_IN_USE) {
        print('The account already exists for that email.');
        return e.code;
      }if (e.code == INVALID_EMAIL) {
        print('Enter Email According To Pattern.');
        return e.code;
      }else {
        print("e.code ${e.code}");
        return e.code;
      }
    } catch (e) {
      print("FirebaseAuthException $e");
      return UNKNOWN_ERROR;
    }
  }


}