import 'package:book_library/domain/domain_exception.dart';
import 'package:book_library/domain/entites/book.dart';
import 'package:book_library/domain/entites/book_shelf.dart';
import 'package:book_library/domain/value_objects/identity.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:matcher/matcher.dart" as matcher;

void main() {
  BookShelf sut;

  setUp(() {
    Identity str = Identity.fromString("aaa");
    sut = BookShelf(id: str);
  });

  group('BookShelf', () {
    test('throws a DomainException when book shelf exceeds 10', () {
      var book = List.generate(11, (index) => Book()).toList();

      // assert
      expect(() => sut.addBook(Book()),
          throwsA(const matcher.TypeMatcher<DomainException>()));
    });
  });
}
