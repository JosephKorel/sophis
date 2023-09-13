import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sophis/app/advice/domain/api.dart';
import 'package:sophis/app/core/error.dart';
import 'package:sophis/app/home/domain/philosopher_entity.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceEvent, AdviceState> {
  AdviceBloc(this._apiUseCase) : super(AdviceInitial()) {
    on<FetchAdviceEvent>(_fetchAdvice);
    on<UpdateAdviceEvent>(_updateState);
    on<AdviceFailureEvent>(_emitFailure);
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
      (r) => emit(
        ReceivedAdvice(
          philosopher: event.philosopherEntity.getPhilosopher(),
          advice: r,
          userInput: event.userInput,
        ),
      ),
    );
  }

  void _updateState(
    UpdateAdviceEvent event,
    Emitter<AdviceState> emit,
  ) {
    emit(event.advice);
  }

  void _emitFailure(
    AdviceFailureEvent event,
    Emitter<AdviceState> emit,
  ) {
    emit(AdviceFailure(failure: event.failure));
  }
}
