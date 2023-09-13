import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sophis/app/advice/data/data_source.dart';
import 'package:sophis/app/advice/domain/api.dart';
import 'package:sophis/app/advice/domain/request_body.dart';
import 'package:sophis/app/core/error.dart';
import 'package:sophis/app/core/types.dart';
import 'package:sophis/app/home/domain/philosopher_entity.dart';

final class ApiRepositoryImpl extends ApiRepository {
  ApiRepositoryImpl(this._dataSource);

  final DataSourceRepository _dataSource;

  @override
  Result<String> getAdvice({
    required PhilosopherEntity philosopher,
    required String userInput,
  }) async {
    try {
      final modelPersonality = philosopher.getPhilosopher().personality();

      final body = ApiRequestBody(modelPersonality: modelPersonality)
          .body(userInput: userInput);

      final response = await _dataSource.postRequest(body: body);

      return Right(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return const Left(
          ConnectionFailure('Connection error'),
        );
      }
      return const Left(
        ResponseFailure('Unknown error'),
      );
    }
  }
}
