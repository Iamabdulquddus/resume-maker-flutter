import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../constants/firebase_constants.dart';
import '../models/user_list_model.dart';

class LoginAndSignUp {

  static Future SignUp(String name, String emailAddress,String password ) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print("credential=> ${credential.user?.email}");
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
            password: password, signInMethod:
          credential.credential?.signInMethod,
          ).toJson()).onError((e, _) => print("Error writing document: $e"));




      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == WEAK_PASSEWORD) {
        print('The password provided is too weak.');
        return e.code;
      } else if (e.code == EMAIL_ALREADY_IN_USE) {
        print('The account already exists for that email.');
        return e.code;
      }
    } catch (e) {
      print("FirebaseAuthException $e");
      return UNKNOWN_ERROR;
    }
  }


}