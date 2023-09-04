import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sophis/app/advice/data/api_data_source.dart';
import 'package:sophis/app/advice/data/response_model.dart';
import 'package:sophis/app/advice/domain/api.dart';
import 'package:sophis/app/advice/domain/request_body.dart';
import 'package:sophis/app/core/error.dart';
import 'package:sophis/app/core/types.dart';
import 'package:sophis/app/home/domain/philosopher_entity.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';

final class ApiRepositoryImpl extends ApiRepository {
  ApiRepositoryImpl(this._apiDataSource);

  final ApiDataSource _apiDataSource;

  final _apiResponseModel = ApiResponseModel.instance;

  @override
  Result<String> getAdvice({
    required PhilosopherEntity philosopher,
    required String userInput,
  }) async {
    try {
      final modelPersonality = Philosophers.values
          .firstWhere((element) => element.name == philosopher.name)
          .personality();

      final body = ApiRequestBody(modelPersonality: modelPersonality)
          .body(userInput: userInput);

      final response = await _apiDataSource.postRequest(body: body);

      final data = _apiResponseModel.getResponse(response: response);

      return Right(data);
    } on SocketException {
      return const Left(
        ConnectionFailure('Seems like your connection is unstable'),
      );
    } catch (e) {
      return const Left(
        ResponseFailure('An unexpected error ocurred'),
      );
    }
  }
}
