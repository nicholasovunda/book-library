import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'failure.dart';

class Title extends Equatable {
  final String value;
  const Title._(this.value);
  static Either<Failure, Title> create(String value) {
    if (value.isEmpty || value == null) {
      return left(Failure("title cannot be empty or null"));
    } else {
      return Right(Title._(value));
    }
  }

  @override
  List<Object?> get props => [value];
}
