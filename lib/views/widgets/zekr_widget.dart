import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sebha_app/models/zekr_model.dart';
import 'package:sebha_app/utils/constants.dart';
import 'package:sebha_app/views/screens/tasbeh_screen.dart';
import '../../view_models/cubits/azkar_cubit/azkar_cubit.dart';

class ZekrWidget extends StatelessWidget {
  const ZekrWidget({super.key, required this.zekrModel});
  final ZekrModel zekrModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TasbehScreen(zekrModel: zekrModel)));
      },
      child: Container(
        margin: EdgeInsets.all(16.w),
        height: 80.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: Constants.kSecondaryColor,
            borderRadius: BorderRadius.circular(16.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<AzkarCubit>(context).deleteZekr(zekrModel);
                  BlocProvider.of<AzkarCubit>(context).getAllAzkar();
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 32.h,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  zekrModel.zekr,
                  style: TextStyle(color: Colors.white, fontSize: 24.sp),
                ),
                Text('عدد التسبيح: ${zekrModel.numberOfTimes}',
                    style: TextStyle(color: Colors.white.withOpacity(0.8)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
