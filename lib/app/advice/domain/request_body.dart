import 'dart:convert';

import 'package:sophis/app/home/domain/philosopher_enum.dart';

extension PhilosopherModelPersonality on Philosophers {
  String personality() {
    // TODO: Create all personalities
    switch (name) {
      case 'seneca':
        return 'You are the spanish philosopher Seneca';

      default:
        return 'You are the spanish philosopher Seneca';
    }
  }
}

final class ApiRequestBody {
  const ApiRequestBody({required this.modelPersonality});

  final String modelPersonality;

  static const _model = 'gpt-3.5-turbo';

  Map<String, dynamic> body({required String userInput}) {
    final messages = <Map<String, dynamic>>[
      {'role': 'system', 'content': modelPersonality},
      {'role': 'user', 'content': userInput},
    ];

    final body = <String, dynamic>{
      'model': _model,
      'messages': jsonEncode(messages),
    };

    return body;
  }
}
