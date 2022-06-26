import 'package:book_library/application/boundaries/add_book_output.dart';
import 'package:book_library/application/boundaries/addbook/Iadd_book_usecase.dart';
import 'package:book_library/domain/domain_exception.dart';
import 'package:book_library/domain/entities/book.dart';
import 'package:book_library/domain/entities/book_shelf.dart';
import 'package:book_library/domain/factories/entity_factory.dart';
import 'package:book_library/domain/repositories/book_repository.dart';
import 'package:book_library/domain/repositories/book_shelf_repository.dart';
import 'package:book_library/domain/value_objects/identity.dart';
import 'package:dartz/dartz.dart';
import 'package:book_library/domain/value_objects/failure.dart';
import 'package:book_library/application/boundaries/addbook/add_book_input.dart';

import '../../domain/entitIes/book.dart';

class AddBookUseCase implements IAddBookUseCase {
  final BookShelfRepository _bookShelfRepository;
  final BookRepository _bookRepository;
  final EntityFactory _entityFactory;

  const AddBookUseCase({
    required BookShelfRepository bookShelfRepository,
    required BookRepository bookRepository,
    required EntityFactory entityFactory,
  })  : _bookRepository = bookRepository,
        _bookShelfRepository = bookShelfRepository,
        _entityFactory = entityFactory;
  @override
  Future<Either<Failure, AddBookOutput>> execute(AddBookInput input) async {
    Book newBook = _createBookFromInput(input);
    Either<Failure, BookShelf> result = _addBookToShelf(
      newBook,
      input.shelfId,
    );
    return Left(
      Failure("there was a failure"),
    );
  }

  _addBookToShelf(
    Book newBook,
    Identity shelfId,
  ) async {
    BookShelf? bookShelf = await _bookShelfRepository.find(shelfId);
    if (bookShelf == null) return Left(Failure("Book shelf not"));
    try {
      bookShelf.addBook(newBook);
    } on DomainException {
      return Left(Failure("Book shelf has reached it's maximum capacity"));
    }
  }

  Book _createBookFromInput(AddBookInput input) {
    return _entityFactory.newBook(
      author: input.author,
      isbn: input.isbn,
      publishDate: input.publishDate,
      tile: input.title,
    );
  }
}
