import 'package:book_library/domain/value_objects/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final String value;

  const Author._(this.value);

  static Either<Failure, Author> create(String value) {
    if (value.isEmpty || value == null) {
      return Left(Failure("author cannot be empty"));
    } else {
      return Right(Author._(value));
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
