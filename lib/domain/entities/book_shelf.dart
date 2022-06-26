import 'package:book_library/domain/entities/book.dart';
import 'package:book_library/domain/value_objects/identity.dart';

import '../domain_exception.dart';

class BookShelf {
  static const maxCapacity = 10;
  Identity id;
  late List<Book> _books;
  List<Book> get books => _books;

  BookShelf({
    required this.id,
  }) {
    _books = [];
  }

  addBook(Book books) {
    if (_books.length == maxCapacity) {
      throw DomainException("BookShelf has reached maximum capacity");
    }
    books.shelfId = id;
    _books.add(books);
  }
}
