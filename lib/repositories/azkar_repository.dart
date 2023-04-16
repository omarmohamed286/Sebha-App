import '../models/zekr_model.dart';

abstract class AzkarRepository {
  Future<void> addZekr(ZekrModel zekr);
  List<ZekrModel> getAllAzkar();
  void deleteZekr(ZekrModel zekr);
  void increaseNumberOfTimesOfZekr(ZekrModel zekr);
  void resetNumberOfTimesOfZekr(ZekrModel zekr);
}
