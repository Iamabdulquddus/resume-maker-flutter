import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:resumemaker/constants/style.dart';

class ShowToast{
  ShowToast({required this.message}) {
    Fluttertoast.showToast(msg: message, backgroundColor: primary,textColor: Colors.white);
  }
  String message;
}