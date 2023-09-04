part of 'advice_bloc.dart';

sealed class AdviceState extends Equatable {
  const AdviceState({
    this.advice,
    this.loading = false,
    this.exception,
  });

  final String? advice;
  final bool loading;
  final Failure? exception;

  @override
  List<Object?> get props => [advice, loading, exception];
}

final class AdviceInitial extends AdviceState {}

final class LoadingAdvice extends AdviceState {
  const LoadingAdvice() : super(advice: null, loading: true);
}

final class ReceivedAdvice extends AdviceState {
  const ReceivedAdvice({required String advice})
      : super(advice: advice, loading: false);
}

final class AdviceFailure extends AdviceState {
  const AdviceFailure({required Failure failure})
      : super(advice: null, loading: false, exception: failure);
}
