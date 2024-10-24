import 'package:dartz/dartz.dart';
import 'package:rickandmorty/src/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
