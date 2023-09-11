import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';

final class SavedAdvice extends Equatable {
  const SavedAdvice({
    required this.philosopher,
    required this.userInput,
    required this.advice,
  });

  factory SavedAdvice.fromMap(Map<String, dynamic> map) {
    return SavedAdvice(
      philosopher:
          Philosophers.values.where((e) => e.name == map['philosopher']).first,
      userInput: map['userInput'] as String,
      advice: map['advice'] as String,
    );
  }

  factory SavedAdvice.fromJson(String source) =>
      SavedAdvice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [philosopher, userInput, advice];

  final Philosophers philosopher;
  final String userInput;
  final String advice;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'philosopher': philosopher.name,
      'userInput': userInput,
      'advice': advice,
    };
  }

  String toJson() => json.encode(toMap());
}
