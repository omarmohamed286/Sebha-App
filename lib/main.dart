import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sebha_app/models/zekr_model.dart';
import 'package:sebha_app/utils/constants.dart';
import 'package:sebha_app/view_models/cubits/azkar_cubit/azkar_cubit.dart';
import 'package:sebha_app/view_models/cubits/tasbeh_cubit/tasbeh_cubit.dart';
import 'data/data_provider.dart';
import 'views/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ZekrModelAdapter());
  await Hive.openBox<ZekrModel>(Constants.kAzkarBox);
  runApp(const SebhaApp());
}

class SebhaApp extends StatelessWidget {
  const SebhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        AzkarDataProvider azkarDataProvider = AzkarDataProvider();
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AzkarCubit(azkarDataProvider)),
            BlocProvider(create: (context) => TasbehCubit(azkarDataProvider)),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
            theme: ThemeData(fontFamily: Constants.kReadexFontFamily),
          ),
        );
      },
    );
  }
}
