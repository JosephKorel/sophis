import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sophis/config/theme/color_schemes.g.dart';

final class AppColorScheme extends Equatable {
  const AppColorScheme({
    required this.light,
    required this.dark,
  });

  factory AppColorScheme.initialValue() =>
      const AppColorScheme(light: lightColorScheme, dark: darkColorScheme);

  @override
  List<Object> get props => [light, dark];

  final ColorScheme light;
  final ColorScheme dark;
}
