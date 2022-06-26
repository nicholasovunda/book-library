import 'package:book_library/domain/value_objects/failure.dart';
import 'package:book_library/domain/value_objects/publish_date.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:matcher/matcher.dart" as matcher;

void main() {
  group('PublishDate', () {
    test('should return failure when date is not correct', () {
      String date = "1234.22.44";
      var value =
          PublishDate.checkDate(date).fold((err) => err, (right) => right);
      //assert
      expect(
        value,
        const matcher.TypeMatcher<Failure>(),
      );
    });

    test('returns a parsed data-time', () {
      String date = "1222-22-22";
      var value = PublishDate.checkDate(date).getOrElse(
        () => throw UnimplementedError(),
      );

      // assert
      expect(
        value.toDate(),
        DateTime(1222, 22, 22),
      );
    });
  });
}
