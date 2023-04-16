import 'package:hive_flutter/hive_flutter.dart';
part 'zekr_model.g.dart';

@HiveType(typeId: 1)
class ZekrModel extends HiveObject{
  @HiveField(0)
  final String zekr;
  @HiveField(1)
   int numberOfTimes;

  ZekrModel(this.zekr, this.numberOfTimes);
}
