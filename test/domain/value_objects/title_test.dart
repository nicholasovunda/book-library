import 'package:book_library/domain/value_objects/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('Title', () {
    test('should return failure when value is empty', () {
      //arrange
      var title = Title.create("").fold((l) => l, (r) => r);

      //assert
      expect(title, matcher.TypeMatcher<Failure>());
    });
    test("should create title when value is not empty", () {
      //arrange
      var title =
          Title.create("New York").getOrElse(() => throw UnimplementedError());

      expect(title.value, "New York");
    });
  });
}

class Title extends Equatable {
  final String value;
  const Title._(this.value);
  static Either<Failure, Title> create(String value) {
    if (value.isEmpty || value == null) {
      return Left(Failure("title cannot be empty or null"));
    } else {
      return Right(Title._(value));
    }
  }

  @override
  List<Object?> get props => [value];
}
