import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sophis/app/saved_advices/domain/saved_advice_entity.dart';

abstract interface class SavedAdviceInteractions {
  List<SavedAdvice> getAdvices();

  Future<void> saveAdvice({required List<SavedAdvice> advices});

  Future<void> deleteAdvice({required List<SavedAdvice> advices});
}

final class AdviceInteraction extends SavedAdviceInteractions {
  AdviceInteraction(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @visibleForTesting
  static const adviceKey = 'advices';

  @override
  List<SavedAdvice> getAdvices() {
    final currentAdvices = _sharedPreferences.getStringList(adviceKey) ?? [];
    return currentAdvices.map(SavedAdvice.fromJson).toList();
  }

  @override
  Future<void> saveAdvice({required List<SavedAdvice> advices}) async {
    final myPrefs = await SharedPreferences.getInstance();
    try {
      final onSave = await myPrefs.setStringList(
        adviceKey,
        advices.map((e) => e.toJson()).toList(),
      );

      if (!onSave) {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAdvice({required List<SavedAdvice> advices}) async {
    try {
      final onDelete = await _sharedPreferences.setStringList(
        adviceKey,
        advices.map((e) => e.toJson()).toList(),
      );

      if (!onDelete) {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
