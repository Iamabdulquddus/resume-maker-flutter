import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/sqflite_constants.dart';
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
                  $SQ_USER_OBJECTIVE $SQ_KEY_TEXT )
                  ''');
  }

  // insert
  Future<int> insertUserBoi(UserResumeListModel userResumeListModel) async {
    // add dog to table
    Database db = await instance.database;
    int result = await db.insert(USER_BIO_TABLE, userResumeListModel.toJson());
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