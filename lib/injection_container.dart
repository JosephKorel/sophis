import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sophis/app/advice/bloc/advice_bloc.dart';
import 'package:sophis/app/advice/data/api_impl.dart';
import 'package:sophis/app/advice/data/data_source.dart';
import 'package:sophis/app/advice/data/dio_client.dart';
import 'package:sophis/app/advice/data/response_model.dart';
import 'package:sophis/app/advice/domain/api.dart';

final locator = GetIt.instance;

void setUpLocator() {
  // bloc
  locator.registerFactory(() => AdviceBloc(locator()));

  // apiUseCase
  locator.registerLazySingleton<ApiUseCase>(
    () => ApiUseCase(
      locator(),
    ),
  );

  // repository
  locator.registerLazySingleton<ApiRepository>(
    () => ApiRepositoryImpl(locator()),
  );

  // response model
  locator.registerLazySingleton(ApiResponseModel.new);

  // data source
  locator.registerLazySingleton<DataSourceRepository>(
    () => DataSourceImpl(
      dio: locator(),
      responseModel: locator(),
    ),
  );

  // dio implementation
  locator
      .registerLazySingleton<DioOperations>(() => DioImplementation(locator()));

  // dio client
  locator.registerLazySingleton<Dio>(Dio.new);
}
