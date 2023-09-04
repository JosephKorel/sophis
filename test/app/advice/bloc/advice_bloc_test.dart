import 'package:flutter_test/flutter_test.dart';
import 'package:sophis/app/advice/bloc/advice_bloc.dart';
import 'package:sophis/app/advice/domain/api.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockApiRepository apiRepository;
  late ApiUseCase apiUseCase;
  late AdviceBloc adviceBloc;

  setUp(() {
    apiRepository = MockApiRepository();
    apiUseCase = ApiUseCase(apiRepository);
    adviceBloc = AdviceBloc(apiUseCase);
  });

  group('Test bloc events', () {
    test('Initial advice bloc state should be InitialAdvice', () {
      expect(adviceBloc.state, AdviceInitial());
    });
  });
}
