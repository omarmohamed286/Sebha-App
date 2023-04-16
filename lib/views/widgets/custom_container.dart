import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sebha_app/models/zekr_model.dart';
import '../../utils/constants.dart';
import '../../view_models/cubits/tasbeh_cubit/tasbeh_cubit.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.azkarList});

  final List<ZekrModel> azkarList;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65.h,
        width: 160.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Constants.kSecondaryColor,
            borderRadius: BorderRadius.circular(15.r)),
        child: Text(
          'المجموع : ${BlocProvider.of<TasbehCubit>(context).getSumOfNumberOfTimes(azkarList)}',
          style: TextStyle(fontSize: 26.sp, color: Colors.white),
        ));
  }
}
