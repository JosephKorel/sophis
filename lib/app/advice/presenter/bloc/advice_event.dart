part of 'advice_bloc.dart';

sealed class AdviceEvent extends Equatable {
  const AdviceEvent();

  @override
  List<Object> get props => [];
}

final class FetchAdviceEvent extends AdviceEvent {
  const FetchAdviceEvent({
    required this.philosopherEntity,
    required this.userInput,
  });

  final PhilosopherEntity philosopherEntity;
  final String userInput;
}

final class UpdateAdviceEvent extends AdviceEvent {
  const UpdateAdviceEvent({
    required this.advice,
  });

  final AdviceState advice;
}
