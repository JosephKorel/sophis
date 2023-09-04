import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sophis/app/advice/bloc/advice_bloc.dart';
import 'package:sophis/app/advice/data/api_impl.dart';
import 'package:sophis/app/advice/domain/api.dart';

final locator = GetIt.instance;

void setUpLocator() {
  // bloc
  locator.registerFactory(() => AdviceBloc(locator()));

  // apiUseCase
  locator.registerLazySingleton(
    () => ApiUseCase(
      locator(),
    ),
  );

  // repository
  locator.registerLazySingleton<ApiRepository>(
    () => ApiRepositoryImpl(
      locator(),
    ),
  );

  // dio client
  locator.registerSingleton(Dio.new);
}
