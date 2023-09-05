part of 'advice_bloc.dart';

sealed class AdviceState extends Equatable {
  const AdviceState({
    this.userInput = '',
    this.advice = '',
    this.loading = false,
    this.exception,
  });

  final String userInput;
  final String advice;
  final bool loading;
  final Failure? exception;

  @override
  List<Object?> get props => [advice, loading, exception];
}

final class AdviceInitial extends AdviceState {}

final class LoadingAdvice extends AdviceState {
  const LoadingAdvice() : super(loading: true);
}

final class ReceivedAdvice extends AdviceState {
  const ReceivedAdvice({
    required String userInput,
    required String advice,
  }) : super(userInput: userInput, advice: advice, loading: false);
}

final class AdviceFailure extends AdviceState {
  const AdviceFailure({required Failure failure})
      : super(userInput: '', advice: '', loading: false, exception: failure);
}
