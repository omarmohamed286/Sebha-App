import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sebha_app/models/zekr_model.dart';
import '../../../repositories/azkar_repository.dart';
part 'tasbeh_state.dart';

class TasbehCubit extends Cubit<TasbehState> {
  TasbehCubit(this.repo) : super(TasbehInitial());
  AzkarRepository repo;

  void increaseNumberOfTimes(ZekrModel zekrModel) {
    repo.increaseNumberOfTimesOfZekr(zekrModel);
    emit(TasbehIncreament());
  }

  void resetNumberOfTimes(ZekrModel zekrModel) {
    repo.resetNumberOfTimesOfZekr(zekrModel);
    emit(TasbehReset());
  }

  int getSumOfNumberOfTimes(List<ZekrModel> azkarList) {
    int sum = 0;
    for (int i = 0; i < azkarList.length; i++) {
      sum += azkarList[i].numberOfTimes;
    }
    return sum;
  }
}
