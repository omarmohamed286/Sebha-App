import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sebha_app/models/zekr_model.dart';
import '../../../repositories/azkar_repository.dart';
part 'add_zekr_state.dart';

class AddZekrCubit extends Cubit<AddZekrState> {
  AddZekrCubit(this.repo) : super(AddZekrInitial());
  AzkarRepository repo;

  Future<void> addZekr(ZekrModel zekr) async {
    emit(AddZekrLoading());
    try {
      await repo.addZekr(zekr);
      emit(AddZekrSuccess());
    } catch (e) {
      emit(AddZekrFailure());
    }
  }
}
