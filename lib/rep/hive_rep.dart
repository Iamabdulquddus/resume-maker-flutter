import 'package:hive/hive.dart';

import '../constants/hive_constanats.dart';

class HiveRep {
  static Box? _box1;

  HiveRep._providerConstructor();
  static final HiveRep instance =  HiveRep._providerConstructor();

  Future<Box> get box async {
    return await Hive.openBox(USER_LOGIN_DETAILS);
  }


  static Future SaveUserInfo(String? uid, String? email, String password, String signInMethod) async {
    Box box = await instance.box;
    box.put(USER_ID, uid);
    box.put(USER_ENAIL, email);
    box.put(USER_PASSWORD, password);
    box.put(USER_SIGN_IN_METHOD, signInMethod);
  }




}