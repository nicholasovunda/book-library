import 'package:book_library/domain/value_objects/identity.dart';

import '../entitIes/book.dart';

abstract class BookRepository {
  add(Book book);
  update(Book book);
  delete({required Identity bookId});
  find({required Identity bookId});
  findAll();
}
