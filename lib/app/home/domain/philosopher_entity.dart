import 'package:equatable/equatable.dart';
import 'package:sophis/app/home/domain/philosopher_enum.dart';

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

  Philosophers getPhilosopher() => Philosophers.values
      .firstWhere((element) => element.philosopherName() == name);
}
