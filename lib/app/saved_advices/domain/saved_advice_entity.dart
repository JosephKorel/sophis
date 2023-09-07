import 'dart:convert';

import 'package:equatable/equatable.dart';

final class SavedAdvice extends Equatable {
  const SavedAdvice({
    required this.philosopherName,
    required this.philosopherSchool,
    required this.userInput,
    required this.advice,
  });

  factory SavedAdvice.fromMap(Map<String, dynamic> map) {
    return SavedAdvice(
      philosopherName: map['philosopherName'] as String,
      philosopherSchool: map['philosopherSchool'] as String,
      userInput: map['userInput'] as String,
      advice: map['advice'] as String,
    );
  }

  factory SavedAdvice.fromJson(String source) =>
      SavedAdvice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props =>
      [philosopherName, philosopherSchool, userInput, advice];

  final String philosopherName;
  final String philosopherSchool;
  final String userInput;
  final String advice;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'philosopherName': philosopherName,
      'philosopherSchool': philosopherSchool,
      'userInput': userInput,
      'advice': advice,
    };
  }

  String toJson() => json.encode(toMap());
}
