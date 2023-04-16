import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sebha_app/utils/constants.dart';

void showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message,
        style: TextStyle(
            fontSize: 18.sp, fontFamily: Constants.kReadexFontFamily)),
    backgroundColor: Constants.kPrimaryColor,
  ));
}
