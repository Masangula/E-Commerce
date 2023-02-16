import 'package:ecommerce/app/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CustomToast {
  static success(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      fontSize: 12,
      backgroundColor: AppColors.greenColor,
      timeInSecForIosWeb: 2,
    );
  }

  static error(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      fontSize: 12,
      backgroundColor: AppColors.redColor,
      timeInSecForIosWeb: 2,
    );
  }

  static normal(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      fontSize: 12,
      backgroundColor: Colors.grey.shade800,
      timeInSecForIosWeb: 2,
    );
  }

  static primary(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      fontSize: 12,
      backgroundColor: Colors.grey.shade800,
      timeInSecForIosWeb: 2,
    );
  }
}
