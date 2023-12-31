import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sophis/app/saved_advices/domain/saved_advice_entity.dart';
import 'package:sophis/app/saved_advices/presenter/controller/saved_advice_controller.dart';

part 'saved_advice_state.dart';

class SavedAdviceCubit extends Cubit<SavedAdviceState> {
  SavedAdviceCubit(this._controller)
      : super(
          SavedAdviceInitial(
            savedAdvices: _controller.getAdvices(),
          ),
        );
  final SavedAdviceInteractions _controller;

  void getAdvices() {
    emit(SavedAdviceList(savedAdvices: _controller.getAdvices()));
  }

  Future<void> saveAdvice({required SavedAdvice adviceToSave}) async {
    final advices = [...state.savedAdvices, adviceToSave];

    emit(SavedAdviceLoading(savedAdvices: advices));

    try {
      await _controller.saveAdvice(advices: advices);

      getAdvices();
    } catch (e) {
      return;
    }
  }

  Future<void> removeAdvice({required String adviceText}) async {
    final advices = state.savedAdvices
        .where((element) => element.advice != adviceText)
        .toList();

    emit(SavedAdviceLoading(savedAdvices: advices));

    try {
      await _controller.deleteAdvice(advices: advices);

      getAdvices();
    } catch (e) {
      return;
    }
  }
}
