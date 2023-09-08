import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sophis/app/core/cubit/scheme.dart';
import 'package:sophis/app/home/ui/pages/main.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void changeTheme({required int pageIndex}) {
    final newColorScheme = themeColors[pageIndex];
    emit(
      ThemeChange(
        colorScheme: newColorScheme,
      ),
    );
  }
}
