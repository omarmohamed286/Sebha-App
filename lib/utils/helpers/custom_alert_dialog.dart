import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sebha_app/models/zekr_model.dart';
import '../../view_models/cubits/azkar_cubit/azkar_cubit.dart';
import '../../view_models/cubits/tasbeh_cubit/tasbeh_cubit.dart';
import '../constants.dart';

Future<dynamic> showCustomAlertDialog(
    BuildContext context, ZekrModel zekrModel) {
  return AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          dialogBorderRadius: BorderRadius.circular(50.r),
          animType: AnimType.scale,
          desc: '!سوف يتم تصفير ما قمت به',
          descTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
          dialogBackgroundColor: Constants.kPrimaryColor,
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            BlocProvider.of<TasbehCubit>(context).resetNumberOfTimes(zekrModel);
            BlocProvider.of<AzkarCubit>(context).getAllAzkar();
          },
          btnCancelText: 'إلغاء',
          btnOkText: 'تصفير')
      .show();
}
