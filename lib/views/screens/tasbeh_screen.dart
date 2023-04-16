import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sebha_app/models/zekr_model.dart';
import 'package:sebha_app/utils/constants.dart';
import 'package:sebha_app/view_models/cubits/tasbeh_cubit/tasbeh_cubit.dart';
import 'package:sebha_app/views/widgets/custom_button.dart';
import '../../utils/helpers/custom_alert_dialog.dart';
import '../../view_models/cubits/azkar_cubit/azkar_cubit.dart';

class TasbehScreen extends StatelessWidget {
  const TasbehScreen({super.key, required this.zekrModel});

  final ZekrModel zekrModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kPrimaryColor,
      body: BlocBuilder<TasbehCubit, TasbehState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Text(zekrModel.zekr,
                  style: TextStyle(color: Colors.white, fontSize: 42.sp)),
              SizedBox(height: 30.h),
              Center(
                child: CircleAvatar(
                  radius: 100.r,
                  backgroundColor: Constants.kSecondaryColor,
                  child: CircleAvatar(
                    radius: 95.r,
                    backgroundColor: Constants.kPrimaryColor,
                    child: Center(
                        child: Text(
                      '${zekrModel.numberOfTimes}',
                      style: TextStyle(fontSize: 54.sp),
                    )),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              CustomButton(
                  icon: Icons.add,
                  iconRadius: 52,
                  onPressed: () {
                    BlocProvider.of<TasbehCubit>(context)
                        .increaseNumberOfTimes(zekrModel);
                    BlocProvider.of<AzkarCubit>(context).getAllAzkar();
                  }),
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CustomButton(
                        icon: Icons.refresh,
                        iconRadius: 30,
                        onPressed: () {
                          showCustomAlertDialog(context, zekrModel);
                        }),
                  ),
                ],
              ),
              const Spacer(flex: 1),
            ],
          );
        },
      ),
    );
  }
}
