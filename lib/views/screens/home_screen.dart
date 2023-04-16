import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sebha_app/views/widgets/custom_container.dart';
import '../../models/zekr_model.dart';
import '../../utils/constants.dart';
import '../../utils/helpers/custom_modal_bottom_sheet.dart';
import '../../view_models/cubits/azkar_cubit/azkar_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/zekr_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<AzkarCubit>(context).getAllAzkar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kPrimaryColor,
      body: SingleChildScrollView(
        child: BlocBuilder<AzkarCubit, AzkarState>(
          builder: (context, state) {
            List<ZekrModel> azkarList =
                BlocProvider.of<AzkarCubit>(context).azkarList;
            return Column(
              children: [
                SizedBox(height: 20.h),
                SizedBox(
                  height: ScreenUtil().screenHeight / 1.3,
                  width: ScreenUtil().screenWidth / 1.3,
                  child: ListView.builder(
                      itemCount: azkarList.length,
                      itemBuilder: (context, index) {
                        return ZekrWidget(zekrModel: azkarList[index]);
                      }),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomContainer(azkarList: azkarList),
                      CustomButton(
                        icon: Icons.add,
                        iconRadius: 30,
                        onPressed: () {
                          showCustomBottomSheet(context);
                        },
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
