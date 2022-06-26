import 'package:book_library/domain/entities/book_shelf.dart';
import 'package:book_library/domain/value_objects/identity.dart';

abstract class BookShelfRepository {
  add(BookShelf bookShelf);
  update(BookShelf bookShelf);
  find(Identity shelfId);
}
