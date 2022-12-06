import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/sqflite_constants.dart';
import '../models/education_list_model.dart';
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
    await db.execute('''Create TABLE $USER_EDUCATION (
                  $SQ_EDUCATION_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_GPA_OR_MARKS $SQ_KEY_TEXT,
                  $SQ_USER_JOIN_FROM_YEAR $SQ_KEY_TEXT, 
                  $SQ_USER_JOIN_TO_YEAR $SQ_KEY_TEXT, 
                  $SQ_USER_UNI_OR_SCHOOL $SQ_KEY_TEXT, 
                  $SQ_USER_DEGREE_OR_COURSE $SQ_KEY_TEXT
                   )
                  ''');
    await db.execute('''Create TABLE $USER_EXPERIENCE (
                  $SQ_EXPERIENCE_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_COMPANY_NAME $SQ_KEY_TEXT,
                  $SQ_USER_JOB_TITLE $SQ_KEY_TEXT, 
                  $SQ_USER_COMPANY_JOIN_FROM_YEAR $SQ_KEY_TEXT, 
                  $SQ_USER_COMPANY_LEVE_TO_YEAR $SQ_KEY_TEXT, 
                  $SQ_USER_DETAILS $SQ_KEY_TEXT
                   )
                  ''');
    await db.execute('''Create TABLE $USER_SKILLS (
                  $SQ_SKILLS_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_SKILLS $SQ_KEY_TEXT
                   )
                  ''');
    await db.execute('''Create TABLE $USER_REFERENC (
                  $SQ_REFERENC_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_REFERENC_NAME $SQ_KEY_TEXT,
                  $SQ_REFERENC_JOB_TITLE $SQ_KEY_TEXT,
                  $SQ_REFERENC_COMPANY_NAME $SQ_KEY_TEXT,
                  $SQ_REFERENC_EMAIL $SQ_KEY_TEXT,
                  $SQ_REFERENC_PHONE_NO $SQ_KEY_TEXT
                   )
                  ''');
    await db.execute('''Create TABLE $USER_INTEREST (
                  $SQ_INTEREST_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_INTEREST $SQ_KEY_TEXT
                   )
                  ''');
    await db.execute('''Create TABLE $USER_PROJECTS (
                  $SQ_PROJECTS_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_USER_PROJECTS_TITLE $SQ_KEY_TEXT,
                  $SQ_USER_PROJECTS_DETAILS $SQ_KEY_TEXT
                   )
                  ''');
    await db.execute('''Create TABLE $USER_LANGUAGE (
                  $SQ_LANGUAGE_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_LANGUAGE_TITLE $SQ_KEY_TEXT
                   )
                  ''');

    await db.execute('''Create TABLE $USER_AWARDS (
                  $SQ_AWARDS_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_AWARDS $SQ_KEY_TEXT
                   )
                  ''');

    await db.execute('''Create TABLE $USER_PUBLICATION (
                  $SQ_PUBLICATION_TABLE_ID $SQ_KEY_INTEGER PRIMARY KEY AUTOINCREMENT,
                  $SQ_PUBLICATION_TITLE $SQ_KEY_TEXT,
                  $SQ_PUBLICATION_DETAILS $SQ_KEY_TEXT
                   )
                  ''');



  }

  Future<int> getLastId() async {
    Database db = await instance.database;
    int lastItem =await db.query(
        USER_BIO_TABLE,
        orderBy: "$SQ_USER_ID DESC",
        limit: 1
    ) as int;
    return lastItem;
  }

  // insert
  Future<int> insertUserBoi(UserResumeListModel userResumeListModel) async {
    // add dog to table
    Database db = await instance.database;
    int result = await db.insert(USER_BIO_TABLE, userResumeListModel.toJson());
    return result;
  }
  Future<int> insertUserEducation(EducationListModel educationListModel) async {
    // add dog to table
    Database db = await instance.database;
    int result = await db.insert(USER_BIO_TABLE, educationListModel.toJson());
    return result;
  }

  // read operation
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