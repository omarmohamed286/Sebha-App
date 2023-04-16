import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../models/zekr_model.dart';
import '../../../repositories/azkar_repository.dart';
part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit(this.repo) : super(AzkarInitial());
  AzkarRepository repo;

  List<ZekrModel> azkarList = [];
  void getAllAzkar() {
    azkarList = repo.getAllAzkar();
    emit(GetAzkarSuccess());
  }

  void deleteZekr(ZekrModel zekr) {
    repo.deleteZekr(zekr);
    emit(ZekrDeleted());
  }
}
