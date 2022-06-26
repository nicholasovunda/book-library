import 'package:book_library/application/boundaries/addbook/add_book_input.dart';
import 'package:book_library/application/usecases/add_book_use_case.dart';
import 'package:book_library/domain/factories/entity_factory.dart';
import 'package:book_library/domain/repositories/book_repository.dart';
import 'package:book_library/domain/repositories/book_shelf_repository.dart';
import 'package:book_library/domain/value_objects/author.dart';
import 'package:book_library/domain/value_objects/identity.dart';
import 'package:book_library/domain/value_objects/isbn.dart';
import 'package:book_library/domain/value_objects/publish_date.dart';
import 'package:book_library/domain/value_objects/title.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'dart:async';

class MockShelfRepository extends Mock implements BookShelfRepository {}

class MockBookRepository extends Mock implements BookRepository {}

class MockEntityFactory extends Mock implements EntityFactory {}

void main() {
  AddBookUseCase? sut;
  late MockShelfRepository mockShelfRepository;
  MockBookRepository mockBookRepository;
  MockEntityFactory mockEntityFactory;

  setUp(() {
    mockBookRepository = MockBookRepository();
    mockShelfRepository = MockShelfRepository();
    mockEntityFactory = MockEntityFactory();

    sut = AddBookUseCase(
      bookShelfRepository: mockShelfRepository,
      bookRepository: mockBookRepository,
      entityFactory: mockEntityFactory,
    );
  });

  group('add book use case', () {
    var title =
        Title.create("book Title").getOrElse(() => throw UnimplementedError());
    var author = Author.create("book author")
        .getOrElse(() => throw UnimplementedError());
    var isbn = ISBN
        .create("ISBN-10: 0-596-52068-9")
        .getOrElse(() => throw UnimplementedError());
    var publishDate = PublishDate.checkDate("2022-06-26")
        .getOrElse(() => throw UnimplementedError());
    var input = AddBookInput(
        shelfId: Identity.fromString("add"),
        title: title,
        author: author,
        isbn: isbn,
        publishDate: publishDate);
    test("should return a failure when adding book to a non existing bookshelf",
        () async {
      //arrange
      when(mockShelfRepository.find(input.shelfId))
          .thenAnswer((realInvocation) => null);

      var result = await sut!.execute(input);

      expect(result.isLeft(), true);
    });
  });
}
