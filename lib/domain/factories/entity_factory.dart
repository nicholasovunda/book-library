import 'package:book_library/domain/value_objects/author.dart';
import 'package:book_library/domain/value_objects/isbn.dart';
import 'package:book_library/domain/value_objects/publish_date.dart';

import '../entitIes/book.dart';

abstract class EntityFactory {
  Book newBook({
    required Title tile,
    required Author author,
    required ISBN isbn,
    required PublishDate publishDate,
  });
}
