import 'package:book_library/domain/entites/book.dart';
import 'package:book_library/domain/value_objects/identity.dart';
import 'package:flutter/material.dart';

import '../domain_exception.dart';

class BookShelf {
  static const maxCapacity = 10;
  Identity id;
  final List<Book> _books;
  List<Book> get books => _books;

  BookShelf(this._books, {required this.id});

  addBook(Book book) {
    if (_books.length == maxCapacity) {
      throw DomainException("BookShelf has reached maximum capacity");
    }
    book.shelfId = id;
    _books.add(book);
  }
}
