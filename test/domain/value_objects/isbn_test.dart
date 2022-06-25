import 'package:book_library/domain/value_objects/isbn.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:matcher/matcher.dart" as matcher;
import 'package:book_library/domain/value_objects/failure.dart';

import 'title_test.dart';

void main() {
  group('ISBN', () {
    test("should return failure when invalid isbn", () {
      var isbn = ISBN.create("898989").fold((err) => err, (isbn) => isbn);

      expect(isbn, const matcher.TypeMatcher<Failure>());
    });

    test('should return isbn when the value is valid isbn-10', () {
      String str = "ISBN-10: 0-596-52068-9";

      var isbn = ISBN.create(str).getOrElse(() => throw UnimplementedError());

      expect(isbn.value, str);
    });
  });
}
