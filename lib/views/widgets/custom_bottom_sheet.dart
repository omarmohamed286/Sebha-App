import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sebha_app/data/data_provider.dart';
import 'package:sebha_app/models/zekr_model.dart';
import '../../utils/constants.dart';
import '../../utils/helpers/custom_snack_bar.dart';
import '../../view_models/cubits/add_zekr_cubit/add_zekr_cubit.dart';
import '../../view_models/cubits/azkar_cubit/azkar_cubit.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final formKey = GlobalKey<FormFieldState>();
  String? zekr;
  int numberOfTimes = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddZekrCubit(AzkarDataProvider()),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: SizedBox(
            height: 300.h,
            child: BlocConsumer<AddZekrCubit, AddZekrState>(
              listener: (context, state) {
                if (state is AddZekrSuccess) {
                  Navigator.pop(context);
                  BlocProvider.of<AzkarCubit>(context).getAllAzkar();
                } else if (state is AddZekrFailure) {
                  showCustomSnackBar(
                      context, '!حدث خطأ يرجي المحاولة مرة أخري');
                }
              },
              builder: (context, state) {
                if (state is AddZekrLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Constants.kSecondaryColor,
                  ));
                }
                return Column(
                  children: [
                    const Spacer(flex: 1),
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      key: formKey,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'برجاء ملئ الخانة بشكل صحيح';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'أضف الذكر',
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 24.sp),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: const BorderSide(
                                  color: Constants.kSecondaryColor))),
                      onSaved: (newValue) {
                        zekr = newValue;
                      },
                    ),
                    SizedBox(height: 30.h),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          BlocProvider.of<AddZekrCubit>(context)
                              .addZekr(ZekrModel(zekr!, numberOfTimes));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.kSecondaryColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 16.h)),
                      child: Text(
                        'إضافة',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                    const Spacer(flex: 1),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
