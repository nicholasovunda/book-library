import 'package:book_library/domain/value_objects/author.dart';
import 'package:book_library/domain/value_objects/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:matcher/matcher.dart" as matcher;

void main() {
  group('Author', () {
    test('if author is null returns author cannot be empty ', () {
      var value = Author.create("").fold((err) => err, (pass) => pass);

      //assert
      expect(
        value,
        const matcher.TypeMatcher<Failure>(),
      );
    });

    test("When value is not null returns the value", () {
      String str = "Not empty";
      var value = Author.create(str).getOrElse(
        () => throw UnimplementedError(),
      );

      //assert
      expect(value.value, str);
    });
  });
}
