import 'package:fluttertoast/fluttertoast.dart';

class ShowToast{
  ShowToast({required this.message}) {
    Fluttertoast.showToast(msg: message);
  }
  String message;
}