import 'package:sophis/app/core/types.dart';

abstract class ApiRepository {
  Result<String> getAdvice();
}

final class ApiUseCase {
  const ApiUseCase(this.apiRepository);

  final ApiRepository apiRepository;

  Result<String> call() {
    return apiRepository.getAdvice();
  }
}
