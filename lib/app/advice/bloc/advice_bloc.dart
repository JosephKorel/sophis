import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sophis/app/advice/domain/api.dart';
import 'package:sophis/app/core/error.dart';
import 'package:sophis/app/home/domain/philosopher_entity.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc(this._apiUseCase) : super(AdviceInitial()) {
    on<FetchAdviceEvent>(_fetchAdvice);
  }
  final ApiUseCase _apiUseCase;

  Future<void> _fetchAdvice(
    FetchAdviceEvent event,
    Emitter<AdviceState> emit,
  ) async {
    final advice = await _apiUseCase.call(
      philosopher: event.philosopherEntity,
      userInput: event.userInput,
    );

    advice.fold(
      (l) => emit(AdviceFailure(failure: l)),
      (r) => emit(ReceivedAdvice(advice: r, userInput: event.userInput)),
    );
  }
}
