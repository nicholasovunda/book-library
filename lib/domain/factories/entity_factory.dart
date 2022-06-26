import 'package:book_library/domain/entities/book_shelf.dart';
import 'package:book_library/domain/value_objects/author.dart';
import 'package:book_library/domain/value_objects/isbn.dart';
import 'package:book_library/domain/value_objects/publish_date.dart';

import '../entitIes/book.dart';
import '../value_objects/title.dart';

abstract class EntityFactory {
  Book newBook({
    required Title tile,
    required Author author,
    required ISBN isbn,
    required PublishDate publishDate,
  });

  BookShelf newBookShelf();
}
