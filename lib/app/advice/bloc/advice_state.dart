part of 'advice_bloc.dart';

sealed class AdviceState extends Equatable {
  const AdviceState({
    this.userInput = '',
    this.advice = '',
    this.loading = true,
    this.exception,
  });

  final String userInput;
  final String advice;
  final bool loading;
  final Failure? exception;

  @override
  List<Object?> get props => [userInput, advice, loading, exception];
}

final class AdviceInitial extends AdviceState {}

final class ReceivedAdvice extends AdviceState {
  const ReceivedAdvice({
    required super.userInput,
    required super.advice,
  }) : super(loading: false);
}

final class AdviceFailure extends AdviceState {
  const AdviceFailure({required Failure failure})
      : super(userInput: '', advice: '', loading: false, exception: failure);
}
