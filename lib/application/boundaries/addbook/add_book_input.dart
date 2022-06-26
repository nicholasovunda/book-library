import 'package:book_library/domain/value_objects/identity.dart';
import 'package:book_library/domain/value_objects/publish_date.dart';

import '../../../domain/value_objects/author.dart';
import '../../../domain/value_objects/isbn.dart';
import '../../../domain/value_objects/title.dart';

class AddBookInput {
  final Identity shelfId;
  final Title title;
  final Author author;
  final ISBN isbn;
  final PublishDate publishDate;

  AddBookInput(
      {required this.shelfId,
      required this.title,
      required this.author,
      required this.isbn,
      required this.publishDate});
}
