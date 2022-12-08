import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:resumemaker/constants/images.dart';
import 'package:resumemaker/controller/resume_controller.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/sqflite_constants.dart';
import '../models/education_list_model.dart';
import '../models/experience_list_model.dart';
import '../models/user_list_model.dart';
import '../models/user_resume_list_model.dart';

class DatabaseHelper {

  // database
  DatabaseHelper._privateConstructor(); // Name constructor to create instance of database
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  // getter for database

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS
    // to store database

    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/$USERS_INFO_DB';

    // open/ create database at a given path
    var studentsDatabase = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return studentsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''Create TABLE $USER_BIO_TABLE (
                  $SQ_USER_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_NAME $SQ_KEY_TEXT,
                  $SQ_USER_EMAIL $SQ_KEY_TEXT, 
                  $SQ_USER_PHONE_NO $SQ_KEY_TEXT, 
                  $SQ_USER_DOB $SQ_KEY_TEXT, 
                  $SQ_USER_ADDRESS $SQ_KEY_TEXT, 
                  $SQ_USER_WEBSITE $SQ_KEY_TEXT,
                  $SQ_USER_OBJECTIVE $SQ_KEY_TEXT
                  )
                  ''');

    // await db.execute('''Create TABLE $USER_BIO_TABLE (
    //               $SQ_USER_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
    //               $SQ_USER_NAME $SQ_KEY_TEXT,
    //               $SQ_USER_EMAIL $SQ_KEY_TEXT,
    //               $SQ_USER_PHONE_NO $SQ_KEY_TEXT,
    //               $SQ_USER_DOB $SQ_KEY_TEXT,
    //               $SQ_USER_ADDRESS $SQ_KEY_TEXT,
    //               $SQ_USER_WEBSITE $SQ_KEY_TEXT,
    //               $SQ_USER_OBJECTIVE $SQ_KEY_TEXT,
    //               $SQ_USER_EDUCATION $SQ_KEY_TEXT,
    //               $SQ_USER_EXPERIENCE $SQ_KEY_TEXT,
    //               $SQ_USER_SKILLS $SQ_KEY_TEXT,
    //               $SQ_USER_REFERENC $SQ_KEY_TEXT,
    //               $SQ_USER_INTEREST $SQ_KEY_TEXT,
    //               $SQ_USER_PROJECTS $SQ_KEY_TEXT,
    //               $SQ_USER_LANGUAGE $SQ_KEY_TEXT,
    //               $SQ_USER_AWARDS $SQ_KEY_TEXT,
    //               $SQ_USER_PUBLICATION $SQ_KEY_TEXT
    //               )
    //               ''');
    await db.execute('''Create TABLE $USER_EDUCATION (
                  $SQ_EDUCATION_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_USER_GPA_OR_MARKS $SQ_KEY_TEXT,
                  $SQ_USER_JOIN_FROM_YEAR $SQ_KEY_TEXT,
                  $SQ_USER_END_TO_YEAR $SQ_KEY_TEXT,
                  $SQ_USER_UNI_OR_SCHOOL $SQ_KEY_TEXT,
                  $SQ_USER_DEGREE_OR_COURSE $SQ_KEY_TEXT
                   )
                  ''');
    await db.execute('''Create TABLE $USER_EXPERIENCE (
                  $SQ_EXPERIENCE_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_USER_COMPANY_NAME $SQ_KEY_TEXT,
                  $SQ_USER_JOB_TITLE $SQ_KEY_TEXT,
                  $SQ_USER_COMPANY_JOIN_FROM_YEAR $SQ_KEY_TEXT,
                  $SQ_USER_COMPANY_LEVE_TO_YEAR $SQ_KEY_TEXT,
                  $SQ_USER_DETAILS $SQ_KEY_TEXT
                   )
                  ''');
    await db.execute('''Create TABLE $USER_SKILLS (
                  $SQ_SKILLS_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_USER_SKILLS $SQ_KEY_TEXT
                   )
                  ''');
    await db.execute('''Create TABLE $USER_REFERENC (
                  $SQ_REFERENC_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_REFERENC_NAME $SQ_KEY_TEXT,
                  $SQ_REFERENC_JOB_TITLE $SQ_KEY_TEXT,
                  $SQ_REFERENC_COMPANY_NAME $SQ_KEY_TEXT,
                  $SQ_REFERENC_EMAIL $SQ_KEY_TEXT,
                  $SQ_REFERENC_PHONE_NO $SQ_KEY_TEXT
                   )
                  ''');
    await db.execute('''Create TABLE $USER_INTEREST (
                  $SQ_INTEREST_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_INTEREST $SQ_KEY_TEXT
                   )
                  ''');
    await db.execute('''Create TABLE $USER_PROJECTS (
                  $SQ_PROJECTS_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_USER_PROJECTS_TITLE $SQ_KEY_TEXT,
                  $SQ_USER_PROJECTS_DETAILS $SQ_KEY_TEXT
                   )
                  ''');
    await db.execute('''Create TABLE $USER_LANGUAGE (
                  $SQ_LANGUAGE_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_LANGUAGE_TITLE $SQ_KEY_TEXT
                   )
                  ''');

    await db.execute('''Create TABLE $USER_AWARDS (
                  $SQ_AWARDS_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_AWARDS $SQ_KEY_TEXT
                   )
                  ''');

    await db.execute('''Create TABLE $USER_PUBLICATION (
                  $SQ_PUBLICATION_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_ID2 $SQ_KEY_INTEGER,
                  $SQ_PUBLICATION_TITLE $SQ_KEY_TEXT,
                  $SQ_PUBLICATION_DETAILS $SQ_KEY_TEXT
                   )
                  ''');



  }
  /// Get Last Resume Id
  Future<int> getLastId() async {
    List<UserResumeListModel> userList = [];
    Database db = await instance.database;
    var lastItem =await db.query(
        USER_BIO_TABLE,
        orderBy: "$SQ_USER_ID DESC",
        limit: 1
    );
    for (var userResumeListModel in lastItem) {
      userList.add(UserResumeListModel.fromJson(userResumeListModel));
    }
    return userList.isNotEmpty ? int.parse(userList[0].id.toString()) : 0;
  }
  /// Insert UserResumeListModel
  Future<int> insertUserBoi(UserResumeListModel userResumeListModel) async {
    // add dog to table
    Database db = await instance.database;
    int result = await db.insert(USER_BIO_TABLE, userResumeListModel.toJson());
    return result;
  }
  /// Update UserResumeListModel
  Future<int> updateUserResumeListModel(UserResumeListModel userResumeListModel) async {
    Database db = await instance.database;
    int result = await db.update(USER_BIO_TABLE, userResumeListModel.toJson(), where: 'id=?', whereArgs: [userResumeListModel.id]);
    return result;
  }
  /// Get All UserResumeListModel
  Future<List<UserResumeListModel>> getAll() async {
    List<UserResumeListModel> userlist = [];
    Database db = await instance.database;
    // read data from table
    List<Map<String, dynamic>> listMap = await db.query(USER_BIO_TABLE);
    for (var userResumeListModel in listMap) {
      userlist.add(UserResumeListModel.fromJson(userResumeListModel));
    }
    return userlist;
  }




  /// Insert Education
  insertEducation(List<EducationListModel> list, String sq_user_education, int value) async {
    Database db = await instance.database;
    int? result;
    for(var educationListModel  in list){
      result = await db.insert(USER_EDUCATION, educationListModel.toJson());
    }
    List<EducationListModel> userlist = [];
    List<Map<String, dynamic>> listMap = await  db
        .query(USER_EDUCATION,where: '$SQ_USER_ID2=?', whereArgs: [value]);
       for (var educationListModel in listMap) {
      print("data=> ${EducationListModel.fromJson(educationListModel).end_to_year}");
      userlist.add(EducationListModel.fromJson(educationListModel));
    }
    return result;
  }
  /// Get All Education
  Future<List<EducationListModel>> getAllEducation(int value) async {
    List<EducationListModel> userlist = [];
    Database db = await instance.database;
    // read data from table
    List<Map<String, dynamic>> listMap = await  db
        .rawQuery('SELECT * FROM $USER_EDUCATION WHERE $SQ_USER_ID2 = $value');//db.query(USER_EDUCATION);
    for (var educationListModel in listMap) {
      userlist.add(EducationListModel.fromJson(educationListModel));
    }
    print(userlist);
    return userlist;
  }
  /// del Education Record By ID
  Future<int> deleteAllEducationByID(int id) async {
    Database db = await instance.database;
    int result = await db.delete(USER_EDUCATION, where: '$SQ_USER_ID2=?', whereArgs: [id]);
    return result;
  }



  // Future<int> insertUserOtherDetails( String  data,String columName,int id) async {
  //   // add dog to table
  //   Database db = await instance.database;
  //   int result = await db.update(
  //       USER_BIO_TABLE, {columName: data}, where: 'id=?', whereArgs: [id]);
  //   var dbHelper =  DatabaseHelper.instance;
  //   var result2 = await dbHelper.getAll();
  //
  //   try{
  //     //print(result2[0].education);
  //     String? dta = result2[0].education;
  //
  //     educationListModelFromJson(dta!).degreeOrCourse;
  //
  //
  //     print(educationListModelFromJson(dta!).degreeOrCourse);
  //   }catch (e){
  //     print(e);
  //   }
  //
  //
  //   //int result = await db.insert(USER_EDUCATION, educationListModel.toJson());
  //   return result;
  // }

  // read operation








  //
  // // delete
  // Future<int> deleteDog(int id) async {
  //   Database db = await instance.database;
  //   int result = await db.delete('tbl_dog', where: 'id=?', whereArgs: [id]);
  //   return result;
  // }
  //
  // // update
  // Future<int> updateDog(Dog dog) async {
  //   Database db = await instance.database;
  //   int result = await db.update('tbl_dog', dog.toMap(), where: 'id=?', whereArgs: [dog.id]);
  //   return result;
  // }


}