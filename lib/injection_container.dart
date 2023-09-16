import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophis/app/advice/data/api_impl.dart';
import 'package:sophis/app/advice/data/data_source.dart';
import 'package:sophis/app/advice/data/dio_client.dart';
import 'package:sophis/app/advice/data/response_model.dart';
import 'package:sophis/app/advice/domain/api.dart';
import 'package:sophis/app/advice/presenter/bloc/advice_bloc.dart';
import 'package:sophis/app/saved_advices/presenter/controller/saved_advice_controller.dart';
import 'package:sophis/app/saved_advices/presenter/cubit/saved_advice_cubit.dart';

final locator = GetIt.instance;

Future<void> _initSharedPref() async {
  final sharedPref = await SharedPreferences.getInstance();

  locator.registerLazySingleton<SavedAdviceInteractions>(
    () => AdviceInteraction(sharedPref),
  );

  locator.registerFactory(() => SavedAdviceCubit(locator()));
}

Future<void> setUpLocator() async {
  // Shared preferences related classes
  await _initSharedPref();

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
