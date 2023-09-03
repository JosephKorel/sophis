import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message: message);
}

final class ResponseFailure extends Failure {
  const ResponseFailure(String message) : super(message: message);
}
