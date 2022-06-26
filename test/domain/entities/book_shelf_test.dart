import 'package:book_library/domain/domain_exception.dart';
import 'package:book_library/domain/entities/book.dart';
import 'package:book_library/domain/entities/book_shelf.dart';

import 'package:book_library/domain/value_objects/identity.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:matcher/matcher.dart" as matcher;

void main() {
  late BookShelf sut;

  setUp(() {
    sut = BookShelf(id: Identity.fromString("aaa"));
  });

  group('BookShelf', () {
    test('throws a DomainException when book shelf exceeds 10', () {
      // var book = List.generate(11, (index) => Book()).toList();
      //arrange
      for (int i = 0; i < 10; i++) {
        var book = Book();
        sut.addBook(book);
      }
      // assert
      expect(() => sut.addBook(Book()),
          throwsA(const matcher.TypeMatcher<DomainException>()));
    });
    test("addBook should add book to shelf", () {
      var book = Book();
      sut.addBook(book);
      expect(sut.books.length, 1);
    });
  });
}
