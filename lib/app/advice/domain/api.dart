import 'package:sophis/app/core/types.dart';
import 'package:sophis/app/home/domain/philosopher_entity.dart';

abstract class ApiRepository {
  /// Get advice based on selected philosopher
  Result<String> getAdvice({
    required PhilosopherEntity philosopher,
    required String userInput,
  });
}

final class ApiUseCase {
  const ApiUseCase(this.apiRepository);

  final ApiRepository apiRepository;

  Result<String> call({
    required PhilosopherEntity philosopher,
    required String userInput,
  }) {
    return apiRepository.getAdvice(
      philosopher: philosopher,
      userInput: userInput,
    );
  }
}
