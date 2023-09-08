part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  const ThemeState({
    required this.colorScheme,
    this.loading = false,
  });

  final AppColorScheme colorScheme;
  final bool loading;

  @override
  List<Object> get props => [colorScheme, loading];
}

final class ThemeInitial extends ThemeState {
  ThemeInitial()
      : super(loading: true, colorScheme: AppColorScheme.initialValue());
}

final class ThemeChange extends ThemeState {
  const ThemeChange({required super.colorScheme}) : super(loading: false);
}
