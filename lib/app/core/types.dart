import 'package:dartz/dartz.dart';
import 'package:sophis/app/core/error.dart';

typedef Result<T> = Future<Either<Failure, T>>;
