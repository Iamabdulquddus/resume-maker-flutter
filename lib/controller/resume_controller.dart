import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:resumemaker/models/user_resume_list_model.dart';
import 'package:sqflite/sqflite.dart';

import '../componet/toast_message.dart';
import '../rep/sqflite_rep.dart';

class ResumeController extends GetxController{
  ///BIO
  TextEditingController bioUserName = TextEditingController();
  TextEditingController bioUserEmail = TextEditingController();
  TextEditingController bioUserDOB = TextEditingController();
  TextEditingController bioUserAddress = TextEditingController();
  TextEditingController bioUserPhoneNo = TextEditingController();
  TextEditingController bioUserWebsite = TextEditingController();

  ///Error String
  RxString errorMsg = "".obs;

  RxInt valueEducationController = 1.obs;

  ///List Of Controllers
  List listDegreeOrCourseController = [].obs ;
  List listUniOrSchoolController = [].obs ;
  List listGPAOrMarksController = [].obs ;
  List listJoinFromYearController = [].obs ;
  List listJoinToYearController = [].obs;


  addBio() async {
    try {
      var dbHelper =  DatabaseHelper.instance;
      int result = await dbHelper.insertUserBoi(
          UserResumeListModel(
            name: bioUserName.text,
            email: bioUserEmail.text,
            phoneNo: bioUserPhoneNo.text,
            dob: bioUserDOB.text,
            address: bioUserAddress.text,
            website: bioUserWebsite.text,
            objective: "objective"
          )
      );
      if( result > 0 ){
        ShowToast(message: 'Save Bio');
        print("${dbHelper.getAll()}");
        errorMsg.value = "";
      }

    }on DatabaseException catch(e){
      errorMsg.value = "Personal Details Not Save";
    }catch (e){
      print("SqfliteExecption: $e");
      errorMsg.value = "Personal Details Not Save";
    }
  }


  addEducations(){
    for(int lop=0;lop<listGPAOrMarksController.length;lop++){
    }

  }







}


