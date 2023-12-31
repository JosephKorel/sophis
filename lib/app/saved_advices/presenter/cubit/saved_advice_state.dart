part of 'saved_advice_cubit.dart';

sealed class SavedAdviceState extends Equatable {
  const SavedAdviceState({required this.savedAdvices, this.loading = true});

  final List<SavedAdvice> savedAdvices;
  final bool loading;

  @override
  List<Object> get props => [savedAdvices, loading];
}

final class SavedAdviceInitial extends SavedAdviceState {
  const SavedAdviceInitial({required super.savedAdvices}) : super();
}

final class SavedAdviceLoading extends SavedAdviceState {
  const SavedAdviceLoading({required super.savedAdvices})
      : super(loading: true);
}

final class SavedAdviceAdd extends SavedAdviceState {
  const SavedAdviceAdd({required super.savedAdvices}) : super(loading: true);
}

final class SavedAdviceList extends SavedAdviceState {
  const SavedAdviceList({required super.savedAdvices}) : super(loading: false);
}
