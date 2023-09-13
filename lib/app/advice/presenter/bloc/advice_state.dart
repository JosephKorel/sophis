part of 'advice_bloc.dart';

sealed class AdviceState extends Equatable {
  const AdviceState({
    this.philosopher = Philosophers.seneca,
    this.userInput = '',
    this.advice = '',
    this.loading = true,
    this.exception,
  });

  final Philosophers philosopher;
  final String userInput;
  final String advice;
  final bool loading;
  final Failure? exception;

  @override
  List<Object?> get props =>
      [philosopher, userInput, advice, loading, exception];
}

final class AdviceInitial extends AdviceState {}

final class ReceivedAdvice extends AdviceState {
  const ReceivedAdvice({
    required super.philosopher,
    required super.userInput,
    required super.advice,
  }) : super(loading: false);
}

final class AdviceFailure extends AdviceState {
  const AdviceFailure({
    required super.exception,
    required super.philosopher,
    required super.userInput,
  }) : super(advice: '', loading: false);
}
