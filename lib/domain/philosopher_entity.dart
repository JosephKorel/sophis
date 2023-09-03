import 'package:equatable/equatable.dart';

final class PhilosopherEntity extends Equatable {
  const PhilosopherEntity({
    required this.name,
    required this.country,
    required this.school,
    required this.quote,
    required this.image,
  });

  @override
  List<Object> get props => [name, country, school, quote, image];

  final String name;
  final String country;
  final String school;
  final String quote;
  final String image;
}
