import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:resumemaker/models/education_list_model.dart';
import 'package:resumemaker/models/user_resume_list_model.dart';
import 'package:sqflite/sqflite.dart';

import '../componet/show_toast.dart';
import '../constants/sqflite_constants.dart';
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


  /// Resume ID
  RxInt resumeId = 0.obs;

  /// Check Already Save Or Not
  RxBool checkAlreadySaveOrNot = false.obs;

  addBio() async {
    try {
      var dbHelper =  DatabaseHelper.instance;
      int result;
      if(checkAlreadySaveOrNot.isFalse){
        result = await dbHelper.insertUserBoi(
            UserResumeListModel(
                id: resumeId.value,
                name: bioUserName.text,
                email: bioUserEmail.text,
                phoneNo: bioUserPhoneNo.text,
                dob: bioUserDOB.text,
                address: bioUserAddress.text,
                website: bioUserWebsite.text,
                objective: "objective"
            )
        );
      }else{
        result = await dbHelper.updateUserResumeListModel(
            UserResumeListModel(
                id: resumeId.value,
                name: bioUserName.text,
                email: bioUserEmail.text,
                phoneNo: bioUserPhoneNo.text,
                dob: bioUserDOB.text,
                address: bioUserAddress.text,
                website: bioUserWebsite.text,
                objective: "objective"
            )
        );
        print("record update");
      }

      if( result > 0 ){
        ShowToast(message: 'Save Bio');
        print("${dbHelper.getAll()}");
        errorMsg.value = "";
        checkAlreadySaveOrNot = true.obs;
      }

    }on DatabaseException catch(e){
      print("DatabaseException ${e.getResultCode()}");
      if(e.getResultCode()==1555){
        resumeId.value++;
        errorMsg.value = "already saved";
        print("already saved");
        addBio();
      }if(e.getResultCode()==1){
        errorMsg.value = "no such table found";
      }else{
        print("DatabaseException $e");
        errorMsg.value = "Personal Details Not Save";
      }
    }catch (e){
      print("SqfliteExecption: $e");
      errorMsg.value = "Personal Details Not Save";
    }
  }


  addEducations() async {
    List list = [];
    String data="";


    for(int lop=0;lop<listGPAOrMarksController.length;lop++){
      String marksOrGPA = listGPAOrMarksController[lop].text;
      String joinFromYear = listJoinFromYearController[lop].text;
      String joinToYear = listJoinToYearController[lop].text;
      String uniOrSchool = listUniOrSchoolController[lop].text;
      String degreeOrCourse = listDegreeOrCourseController[lop].text;
      if(marksOrGPA.isEmpty || joinFromYear.isEmpty || joinToYear.isEmpty || uniOrSchool.isEmpty || degreeOrCourse.isEmpty){
        ShowToast(message: 'empty ${lop + 1}');
      }else {
        if(data.isEmpty){
          data = "${EducationListModel(
              gpaOrMarks: marksOrGPA,
              joinFromYear: joinFromYear,
              joinToYear: joinToYear,
              uniOrSchool: uniOrSchool,
              degreeOrCourse: degreeOrCourse
          ).toJson()}";
        }else{
          data =  "$data,${EducationListModel(
              gpaOrMarks: marksOrGPA,
              joinFromYear: joinFromYear,
              joinToYear: joinToYear,
              uniOrSchool: uniOrSchool,
              degreeOrCourse: degreeOrCourse
          ).toJson()}";
        }
      }


    }
    data = "[$data]";
    print("list ${data}");
    try{
      var dbHelper =  DatabaseHelper.instance;
      int result = await dbHelper.insertUserOtherDetails(data,SQ_USER_OBJECTIVE,resumeId.value);
      if(result>0){
        ShowToast(message: "Education Detail Saved");
      }
    }catch(e){
      print(e);
    }


  }


  Future<int> getResumeId() async {
    int? value;
    try{
      var dbHelper =  DatabaseHelper.instance;
      value = resumeId.value = 1 + await dbHelper.getLastId();
      print("resumeId=> ${ resumeId.value }");
      }catch(e){
      print("Exception: $e");
    }
    return value!;
  }







}


