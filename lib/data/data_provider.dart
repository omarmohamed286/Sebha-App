import 'package:hive_flutter/hive_flutter.dart';
import 'package:sebha_app/models/zekr_model.dart';
import 'package:sebha_app/repositories/azkar_repository.dart';
import 'package:sebha_app/utils/constants.dart';

class AzkarDataProvider extends AzkarRepository {
  var azkarBox = Hive.box<ZekrModel>(Constants.kAzkarBox);

  @override
  Future<void> addZekr(ZekrModel zekr) async {
    await azkarBox.add(zekr);
  }

  @override
  void deleteZekr(ZekrModel zekr) {
    zekr.delete();
  }

  @override
  List<ZekrModel> getAllAzkar() {
    return azkarBox.values.toList();
  }

  @override
  void increaseNumberOfTimesOfZekr(ZekrModel zekr) {
    zekr.numberOfTimes++;
    zekr.save();
  }

  @override
  void resetNumberOfTimesOfZekr(ZekrModel zekr) {
    zekr.numberOfTimes = 0;
    zekr.save();
  }
}
