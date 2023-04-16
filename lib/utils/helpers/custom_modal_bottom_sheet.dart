import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../views/widgets/custom_bottom_sheet.dart';
import '../constants.dart';

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Constants.kPrimaryColor,
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            right: 10.w,
            left: 10.w),
        child: const CustomBottomSheet(),
      );
    },
  );
}
